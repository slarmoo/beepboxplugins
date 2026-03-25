import { BeepBoxEffectPlugin, PluginElementType, type PluginElement } from "beepboxplugin";

const pluginName: string = "sustain";

export default class SustainPlugin extends BeepBoxEffectPlugin {
    public pluginName: string = pluginName;
    public about: string = "Holds out the sound for a bit longer by copying and offsetting the waveform";
    public elements: PluginElement[] = [
        {
            type: PluginElementType.slider,
            initialValue: 8,
            max: 16,
            name: "Sustain",
            info: "How long the sustain is, from barely a few milliseconds to several beats",
            hasEnvelope: false,
        },
        {
            type: PluginElementType.slider,
            initialValue: 16,
            max: 32,
            name: "Sustain Vol",
            info: "How audible the sustain is",
            hasEnvelope: true,
        }
    ];
    public effectOrderIndex: number | number[] = 4;
    private sustainDecay: number = Math.pow(2, 8);
    private sustainVol: number = 16;
    private sustainVolDelta: number = 0;
    private sustainDelayLine: Float32Array | null = null;
    private sustainDelayLinePosition: number = 0;
    public reset = () => { 
        this.sustainDelayLinePosition = 0;
        if (this.sustainDelayLine) for (let i: number = 0; i < this.sustainDecay; i++) this.sustainDelayLine[i] = 0.0;
    };
    //@ts-ignore
    public initializeDelayLines = (samplesPerTick: number, samplesPerSecond: number) => { 
        if ((!this.sustainDelayLine || this.sustainDelayLine.length < this.sustainDecay) && this.sustainDecay > 0) {
            this.sustainDelayLine = new Float32Array(this.sustainDecay);
        }
    };
    public instrumentStateFunction = (pluginStarts: number[], pluginEnds: number[], samplesPerTick: number) => {
        const sustainDecay = pluginStarts[0];
        this.sustainDecay = Math.pow(2, sustainDecay);
        this.sustainVol = pluginStarts[1];
        this.sustainVolDelta = (pluginEnds[1] - pluginStarts[1]) / samplesPerTick;
    };
    //@ts-ignore
    public synthFunction = (samples: number | [number, number], runLength: number): number | [number, number] => {
        let sample: number = samples as number;
        if (this.sustainDecay == 0 || !this.sustainDelayLine) return sample;
        this.sustainDelayLinePosition = this.sustainDelayLinePosition & (this.sustainDecay - 1);
        const sustainSample = this.sustainDelayLine![this.sustainDelayLinePosition] * this.sustainVol / 64;
        this.sustainDelayLine![this.sustainDelayLinePosition] = sample;
        sample += sustainSample;
        this.sustainDelayLinePosition++;
        this.sustainVol += this.sustainVolDelta;
        return sample;
    };
    
}