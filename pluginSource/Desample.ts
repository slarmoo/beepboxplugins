import { EffectPlugin, type Element } from "./plugin";

const pluginName: string = "desample";

export default class DesamplePlugin extends EffectPlugin {
    public pluginName: string = pluginName;
    public about: string = "A type of bitcrush where less and less points are used in the waveform";
    public elements: Element[] = [
        {
            type: "slider",
            max: 16,
            name: "Desample"
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
    public initializeDelayLines = (samplesPerTick: number) => { };
    public instrumentStateFunction = (instrument: any) => {
        const desampleRate = instrument.pluginValues[0];
        this.desampleRate = Math.pow(2, desampleRate);
    };
    //@ts-ignore
    public synthFunction = (sample: number, runLength: number) => {
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

//required
(globalThis as any)[pluginName] = DesamplePlugin; 