import { BeepBoxEffectPlugin, PluginElementType, type PluginElement } from "beepboxplugin";

const epsilon: number = (1.0e-20); // For detecting and avoiding float denormals, which have poor performance.

function sanitize(sample: number): number {
    if (Number.isFinite(sample) && Math.abs(sample) >= epsilon) return sample;
    return 0.0;
}

function houseHolder(samples: Float32Array): void {
    let sum: number = 0;
    for (const val of samples) {
        sum += val;
    }
    sum *= 2.0 / samples.length;
    for (let i: number = 0; i < samples.length; i++) {
        samples[i] -= sum;
    }
}

function hamarand(samples: Float32Array): void {
    let prevI: number = 1;
    for (let i: number = 2; i <= samples.length; i <<= 1) {
        for (let j: number = 0; j < samples.length; j += i) {
            const a: number = samples[j];
            const b: number = samples[j + prevI];
            samples[j] = a + b;
            samples[j + prevI] = a - b;
        }
        prevI = i;
    }
    const scalingFactor: number = Math.sqrt(1 / samples.length);
    for (let i: number = 0; i < samples.length; i++) {
        samples[i] *= scalingFactor;
    }
}

class MultichannelMixedFeedback {
    private readonly delaySamples: number[] = [];
    private readonly delayIndices: number[] = [];
    private readonly delays: Float32Array[] = [];

    constructor(private readonly channels: number, public delayMs: number = 150, public decayGain: number = 0.85) {

    }

    public initializeDelayLines(sampleRate: number): void {
        const delayBase = this.delayMs * 0.001 * sampleRate;
        for (let i: number = 0; i < this.channels; i++) {
            this.delaySamples[i] = Math.floor(Math.pow(2, i / this.channels) * delayBase);
            if ((!this.delays[i] || this.delaySamples[i] > this.delays[i].length) && this.delaySamples[i] > 0) {
                this.delays[i] = new Float32Array(this.delaySamples[i]);
                this.delayIndices[i] = 0;
            }
            this.mixed[i] = 0;
        }
    }

    public reset(): void {
        for (let i: number = 0; i < this.channels; i++) {
            for (let j: number = 0; j < this.delaySamples[i]; j++) this.delays[i][j] = 0;
            this.delayIndices[i] = 0;
            this.delayed[i] = 0;
            this.mixed[i] = 0;
        }
    }

    private readonly delayed: Float32Array = new Float32Array(this.channels);
    private readonly mixed: Float32Array = new Float32Array(this.channels);

    public dark: number = 1;

    public process(input: Float32Array): Float32Array {
        for (let i: number = 0; i < this.channels; i++) {
            let delayIndex: number = this.delayIndices[i] + 1;
            if (delayIndex >= this.delaySamples[i]) delayIndex -= this.delaySamples[i];
            this.delayed[i] = this.delays[i][delayIndex];

            //filter
            this.mixed[i] += this.dark * (this.delayed[i] - this.mixed[i]);;
        }
        houseHolder(this.mixed);
        for (let i: number = 0; i < this.channels; i++) {
            let delayIndex: number = this.delayIndices[i] + 1;
            if (delayIndex >= this.delaySamples[i]) delayIndex -= this.delaySamples[i];
            this.delays[i][this.delayIndices[i]] = sanitize(input[i] + this.mixed[i] * this.decayGain);
            this.delayIndices[i] = delayIndex;
        }
        return this.delayed;
    }
}

class DiffusionStep {
    private readonly delaySamples: number[] = [];
    private readonly delayIndices: number[] = [];
    private readonly delays: Float32Array[] = [];
    private readonly flips: boolean[] = [];

    constructor(private readonly channels: number) {
        for (let i: number = 0; i < this.channels; i++) {
            this.flips[i] = Math.round(Math.random()) == 1;
        }
    }

    private delayMsRange: number = 50;

    public initializeDelayLines(sampleRate: number, delayMsRange: number = 50) {
        if (this.delayMsRange != delayMsRange) {
            this.delayMsRange = delayMsRange;
            const delaySamplesRange: number = this.delayMsRange * 0.001 * sampleRate;
            for (let i: number = 0; i < this.channels; i++) {
                const rangeLow: number = delaySamplesRange * i / this.channels;
                const rangeHigh: number = delaySamplesRange * (i + 1) / this.channels;
                this.delaySamples[i] = Math.floor(Math.random() * (rangeHigh - rangeLow) + rangeLow);
            }
        }

        for (let i: number = 0; i < this.channels; i++) {
            if ((!this.delays[i] || this.delaySamples[i] > this.delays[i].length) && this.delaySamples[i] > 0) {
                this.delays[i] = new Float32Array(this.delaySamples[i]);
                this.delayIndices[i] = 0;
            }
        }
    }

    public reset(): void {
        for (let i: number = 0; i < this.channels; i++) {
            for (let j: number = 0; j < this.delaySamples[i]; j++) this.delays[i][j] = 0;
            this.delayIndices[i] = 0;
            this.flips[i] = Math.round(Math.random()) == 1;
            this.delayed[i] = 0;
        }
    }

    private readonly delayed: Float32Array = new Float32Array(this.channels);

    public process(input: Float32Array): Float32Array {
        for (let i: number = 0; i < this.channels; i++) {
            if (!this.delays[i]) return input;
            let delayIndex: number = this.delayIndices[i] + 1;
            if (delayIndex >= this.delaySamples[i]) delayIndex -= this.delaySamples[i];
            this.delayed[i] = this.delays[i][delayIndex] || 0;
            this.delays[i][this.delayIndices[i]] = sanitize(input[i]);
            this.delayIndices[i] = delayIndex;
        }

        hamarand(this.delayed);

        for (let i: number = 0; i < this.channels; i++) {
            if (this.flips[i]) this.delayed[i] *= -1;
        }

        return this.delayed;
    }
}

class DiffuserHalfLengths {

    private diffusionSteps: DiffusionStep[] = [];

    constructor(private readonly channels: number, private readonly stepCount: number, public diffusion: number = 50) {
        this.reset();
    }

    public reset(): void {
        for (let i: number = 0; i < this.stepCount; i++) {
            if (this.diffusionSteps[i]) this.diffusionSteps[i].reset();
        }
    }

    public initializeDelayLines(sampleRate: number): void {
        let delayMS = this.diffusion;
        for (let i: number = 0; i < this.stepCount; i++) {
            if (!this.diffusionSteps[i]) this.diffusionSteps[i] = new DiffusionStep(this.channels);
            this.diffusionSteps[i].initializeDelayLines(sampleRate, delayMS);
            delayMS /= 2;
        }
    }

    public process(input: Float32Array): Float32Array {
        if (this.diffusionSteps.length != this.stepCount) return input;
        for (let i: number = 0; i < this.stepCount; i++) {
            input = this.diffusionSteps[i].process(input);
        }
        return input;
    }
}

const pluginName = "reverb+"

export default class ReverbPlusPlugin extends BeepBoxEffectPlugin {
    public pluginName: string = pluginName;
    public about: string = "A better implementation of reverb based on the ADC talk found here: https://youtu.be/6ZK2Goiyotk?si=HpSDjgY5dtoMC-y6";

    private readonly channels: number = 8;
    private diffusionSteps: number = 4;
    private roomSizeMs: number = 150;
    private readonly rt60: number = 10;
    private static readonly wetMax: number = 16;
    private wet: number = 1;
    private brightness: number = 0.2;
    private wetDelta: number = 0;
    private brightDelta: number = 0;
    private diffusion: number = 50;
    private feedback: MultichannelMixedFeedback | null = null;
    private diffuser: DiffuserHalfLengths | null = null;

    public elements: PluginElement[] = [
        {
            type: PluginElementType.slider,
            initialValue: ReverbPlusPlugin.wetMax,
            max: ReverbPlusPlugin.wetMax,
            name: "Reverb+",
            info: "The dry/wet mix of the reverb+ plugin",
            hasEnvelope: true,
        },
        {
            type: PluginElementType.slider,
            initialValue: 2,
            max: 10,
            name: "Brightness",
            info: "How bright the sound is. Lower values result in a darker tone",
            hasEnvelope: true,
        },
        {
            type: PluginElementType.slider,
            initialValue: 5,
            max: 8,
            name: "Room Size",
            info: "How long the feedback of the reverb lasts",
            hasEnvelope: false,
        },
        {
            type: PluginElementType.slider,
            initialValue: 5,
            max: 10,
            name: "Diffusion",
            info: "How diffuse the reverb is",
            hasEnvelope: false,
        },
    ];
    public effectOrderIndex: number | number[] = 9;
    public reset = () => {
        this.feedback?.reset();
        this.diffuser?.reset();
    };
    private delayLinesInitialized: boolean = false;
    private prevSampleRate: number = 0;
    //@ts-ignore
    public initializeDelayLines = (samplesPerTick: number, samplesPerSecond: number) => {
        if (!this.feedback) this.feedback = new MultichannelMixedFeedback(this.channels, this.roomSizeMs, Math.pow(10, -3 * (this.roomSizeMs / 1000) / this.rt60));
        if (!this.diffuser) this.diffuser = new DiffuserHalfLengths(this.channels, this.diffusionSteps, this.diffusion);
        if (this.prevSampleRate != samplesPerSecond) {
            this.delayLinesInitialized = false;
            this.prevSampleRate = samplesPerSecond;
            this.delayLineLength = 0.1 * this.roomSizeMs * this.prevSampleRate;
        }
        if (this.delayLinesInitialized) return;
        this.feedback.initializeDelayLines(this.prevSampleRate);
        this.diffuser.initializeDelayLines(this.prevSampleRate);
        this.delayLinesInitialized = true;
    };
    public instrumentStateFunction = (pluginStarts: number[], pluginEnds: number[], samplesPerTick: number) => {
        this.wet = Math.min(pluginStarts[0] / ReverbPlusPlugin.wetMax, 1);
        this.roomSizeMs = (pluginStarts[2] + 1) * 25;
        this.brightness = Math.min(pluginStarts[1] / 10, 1);
        this.wetDelta = (pluginEnds[0] - pluginStarts[0]) / samplesPerTick;
        this.brightDelta = (pluginEnds[1] - pluginStarts[1]) / samplesPerTick;
        const diffusion: number = pluginStarts[3] * 10;
        if (diffusion != this.diffusion) {
            this.diffusion = diffusion;
            this.delayLinesInitialized = false; //we changed the diffusion, so we need to rebuild diffuser delay lines
        }
        if (this.feedback) this.feedback.dark = this.brightness;
        if (this.diffuser && this.diffusion != 0) this.diffuser.diffusion = this.diffusion;
        if (this.feedback && this.feedback.delayMs != this.roomSizeMs) {
            this.feedback.delayMs = this.roomSizeMs;
            this.feedback.decayGain = Math.pow(10, -3 * (this.roomSizeMs / 1000) / this.rt60);
            this.delayLinesInitialized = false; //we changed the room size, so we need to rebuild feedback delay lines
        }
    };
    private inputDuplicated: Float32Array = new Float32Array(this.channels);
    private static readonly sqrt2: number = 1 / Math.sqrt(2);
    //@ts-ignore
    public synthFunction = (samples: number | [number, number], runLength: number): number | [number, number] => {
        if (!this.diffuser || !this.feedback || typeof samples == "number") return samples;
        const [sampleL, sampleR] = samples as [number, number];
        this.inputDuplicated[0] = sampleL;
        this.inputDuplicated[1] = sampleR;
        this.inputDuplicated[2] = (sampleL + sampleR) * ReverbPlusPlugin.sqrt2;
        this.inputDuplicated[3] = (sampleL - sampleR) * ReverbPlusPlugin.sqrt2;
        this.inputDuplicated[4] = -sampleL;
        this.inputDuplicated[5] = -sampleR;
        this.inputDuplicated[6] = -(sampleL + sampleR) * ReverbPlusPlugin.sqrt2;
        this.inputDuplicated[7] = -(sampleL - sampleR) * ReverbPlusPlugin.sqrt2;

        const diffuse: Float32Array = this.diffusion ? this.diffuser.process(this.inputDuplicated): this.inputDuplicated;
        const longLasting: Float32Array = this.feedback.process(diffuse);

        let outputL: number = longLasting[0] + longLasting[1] + longLasting[2] + longLasting[3] + longLasting[4] + longLasting[5] + longLasting[6] + longLasting[7];
        let outputR: number = longLasting[4] + longLasting[5] + longLasting[6] + longLasting[7] - longLasting[0] - longLasting[1] - longLasting[2] - longLasting[3];
        outputL /= 2; //scale output
        outputR /= 2;

        samples[0] = (1 - this.wet) * sampleL + this.wet * outputL;
        samples[1] = (1 - this.wet) * sampleR + this.wet * outputR;

        this.wet += this.wetDelta;
        this.feedback.dark += this.brightDelta;

        return samples;
    };
}