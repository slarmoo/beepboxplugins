import { EffectPlugin, type PluginElement } from "./plugin";

const pluginName: string = "sustain";

export default class SustainPlugin extends EffectPlugin {
    public pluginName: string = pluginName;
    public about: string = "Holds out the sound for a bit longer by copying and offsetting the waveform";
    public elements: PluginElement[] = [
        {
            type: "slider",
            initialValue: 0,
            max: 16,
            name: "Sustain"
        },
        {
            type: "slider",
            initialValue: 0,
            max: 32,
            name: "Sustain Vol"
        }
    ];
    public effectOrderIndex: number | number[] = 4;
    private sustainDecay: number = 0;
    private sustainVol: number = 0;
    private sustainDelayLine: Float32Array | null = null;
    private sustainDelayLinePosition: number = 0;
    public reset = () => { 
        this.sustainDelayLinePosition = 0;
        if (this.sustainDelayLine) for (let i: number = 0; i < this.sustainDecay; i++) this.sustainDelayLine[i] = 0.0;
    };
    //@ts-ignore
    public initializeDelayLines = (samplesPerTick: number) => { 
        if ((!this.sustainDelayLine || this.sustainDelayLine.length < this.sustainDecay) && this.sustainDecay > 0) {
            this.sustainDelayLine = new Float32Array(this.sustainDecay);
        }
    };
    public instrumentStateFunction = (instrument: any) => {
        const sustainDecay = instrument.pluginValues[0];
        this.sustainDecay = Math.pow(2, sustainDecay);
        this.sustainVol = instrument.pluginValues[1];
    };
    //@ts-ignore
    public synthFunction = (sample: number, runLength: number) => {
        if (this.sustainDecay == 0 || !this.sustainDelayLine) return sample;
        this.sustainDelayLinePosition = this.sustainDelayLinePosition & (this.sustainDecay - 1);
        const sustainSample = this.sustainDelayLine![this.sustainDelayLinePosition] * this.sustainVol / 64;
        this.sustainDelayLine![this.sustainDelayLinePosition] = sample;
        sample += sustainSample;
        this.sustainDelayLinePosition++;
        return sample;
    };
    
}

//required
(globalThis as any)[pluginName] = SustainPlugin; 