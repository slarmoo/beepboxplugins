import { BeepBoxEffectPlugin, PluginElementType, type PluginElement } from "beepboxplugin";

const pluginName: string = "desample";

export default class DesamplePlugin extends BeepBoxEffectPlugin {
    public pluginName: string = pluginName;
    public about: string = "A type of bitcrush where less and less points are used in the waveform";
    public elements: PluginElement[] = [
        {
            type: PluginElementType.slider,
            initialValue: 2,
            max: 16,
            name: "Desample",
            info: "The distance between points that are interpolated between. More desample results in a less and less recognizable sound",
            hasEnvelope: false
        }
    ];
    public effectOrderIndex: number | number[] = 1;
    private desampleRate: number = 0;
    private desampleTime: number = 0;
    public reset = () => {
        this.desampleTime = 0;
        this.delayLine[0] = 0.0;
        this.delayLine[1] = 0.0;
    };
    private delayLine: Float32Array = new Float32Array(2);
    //@ts-ignore
    public initializeDelayLines = (samplesPerTick: number, samplesPerSecond: number) => { };
    //@ts-ignore
    public instrumentStateFunction = (pluginStarts: number[], pluginEnds: number[], samplesPerTick: number) => {
        const desampleRate = pluginStarts[0];
        this.desampleRate = Math.pow(2, desampleRate);
    };
    //@ts-ignore
    public synthFunction = (samples: number | [number, number], runLength: number): number | [number, number] => {
        let sample: number = samples as number;
        this.desampleTime = this.desampleTime & (this.desampleRate - 1);
        if (this.desampleTime == 0) {
            //index 0 for from value, index 1 for 2 value
            this.delayLine[0] = this.delayLine[1];
            this.delayLine[1] = sample;
        }
        sample = (this.desampleTime / this.desampleRate) * this.delayLine[0] + ((this.desampleRate - this.desampleTime) / this.desampleRate) * this.delayLine[1];
        this.desampleTime++;
        return sample;
    };
    
}