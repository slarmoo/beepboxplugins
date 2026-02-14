import { EffectPlugin, type PluginElement } from "./plugin";

const pluginName: string = "corruption";

export default class CorruptionPlugin extends EffectPlugin {
    public readonly pluginName: string = pluginName;
    public readonly about: string = "Applies corrupting transformations to the waveform";
    public readonly elements: PluginElement[] = [
        {
            type: "slider",
            initialValue: 0,
            max: 32,
            name: "Corruption"
        },
        {
            type: "dropdown",
            initialValue: 0,
            options: [
                "Invert chunks",
                "Asin",
                "Engine",
                "Buzz"
            ],
            name: "Corrupt type"
        }
    ];
    public effectOrderIndex: number | number[] = 4;
    //@ts-ignore
    public initializeDelayLines = (samplesPerTick: number) => { };
    private corruptionAmount: number = 0;
    private corruptionType: number = 0;
    private corruptionTime: number = 0;
    public reset = () => {
        this.corruptionTime = 0;
    }
    public instrumentStateFunction = (instrument: any) => {
        if (this.corruptionTime > 1024) this.corruptionTime = 0;
        this.corruptionAmount = instrument.pluginValues[0];
        this.corruptionType = instrument.pluginValues[1];
        this.corruptionTime = this.corruptionTime + 1;
    };
    

    public synthFunction = (sample: number, runLength: number) => {
        const isCorr0 = Math.max(-1 * Math.abs(this.corruptionType - 0) + 1, 0);
        const isCorr1 = Math.max(-1 * Math.abs(this.corruptionType - 1) + 1, 0);
        const isCorr2 = Math.max(-1 * Math.abs(this.corruptionType - 2) + 1, 0);
        const isCorr3 = Math.max(-1 * Math.abs(this.corruptionType - 3) + 1, 0);
        // const isCorr4 = Math.max(-1 * Math.abs(this.corruptionType - 4)+1, 0);
        // const isCorr5 = Math.max(-1 * Math.abs(this.corruptionType - 5)+1, 0);
        // const isCorr6 = Math.max(-1 * Math.abs(this.corruptionType - 6)+1, 0);
        // const isCorr7 = Math.max(-1 * Math.abs(this.corruptionType - 7)+1, 0);
        // const isCorr8 = Math.max(-1 * Math.abs(this.corruptionType - 8)+1, 0);
        // const isCorr9 = Math.max(-1 * Math.abs(this.corruptionType - 9)+1, 0);
        const corr0helper0 = Math.max(-1 * Math.abs(this.corruptionAmount - 0) + 1, 0);
        const corr0helperInbetween = Math.min(Math.max(-1 * Math.abs(this.corruptionAmount - 32 / 2) + 32 / 2, 0), 1);
        const corr0helperMax = Math.max(-1 * Math.abs(this.corruptionAmount - 32) + 1, 0);
        const corr0helperFunction = 2 * Math.floor((this.corruptionAmount * this.corruptionTime / 32) % 2) - 1;

        const corr0 = corr0helper0 + corr0helperMax * -1 + corr0helperInbetween * corr0helperFunction;
        const corr1 = (2 / Math.PI) * Math.asin(Math.cos(this.corruptionAmount * this.corruptionTime / 32));
        const corr2 = (this.corruptionAmount * this.corruptionTime / 32 - 1) % 2 * -1;
        const corr3 = -1 * Math.min(Math.max(Math.tan(this.corruptionAmount * this.corruptionTime / 32 + 90), -1), 1);
        sample = isCorr0 * corr0 * sample + isCorr1 * corr1 * sample + isCorr2 * corr2 * sample + isCorr3 * corr3 * sample;
        this.corruptionTime += 1 / runLength;
        return sample;
    };
}

//required
(globalThis as any)[pluginName] = CorruptionPlugin; 
