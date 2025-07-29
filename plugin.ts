const plugin1: EffectPlugin = {
    pluginName: "corruption",
    variableNames: ["type", "amount"], //the names of variables in your synth function whose values come from the instrumentStateFunction
    sliders: [
        {
            max: 3,
            name: "corruptionType"
        },
        {
            max: 32,
            name: "corruptionAmount"
        }
    ],
    // there is a pluginDelayLine available to use if desired, 
    // but you must set the size here to something other than 0 if you wish to use it
    delayLineSize: 0,

    // here you may edit values and create new ones, 
    // but you must grab values from instrument.pluginValues[#] 
    // (where # corresponds to the index of your slider),
    // and place values into this.pluginValues[#]
    // (where # corresponds to the index of the variableName)
    instrumentStateFunction: ` 
        this.pluginValues[0] = instrument.pluginValues[0];
        this.pluginValues[1] = instrument.pluginValues[1];
    `,
    synthFunction: `
        const isCorr0 = Math.max(-1 * Math.abs(type - 0)+1, 0);
        const isCorr1 = Math.max(-1 * Math.abs(type - 1)+1, 0);
        const isCorr2 = Math.max(-1 * Math.abs(type - 2)+1, 0);
        const isCorr3 = Math.max(-1 * Math.abs(type - 3)+1, 0);
        const isCorr4 = Math.max(-1 * Math.abs(type - 4)+1, 0);
        const isCorr5 = Math.max(-1 * Math.abs(type - 5)+1, 0);
        const isCorr6 = Math.max(-1 * Math.abs(type - 6)+1, 0);
        const isCorr7 = Math.max(-1 * Math.abs(type - 7)+1, 0);
        const isCorr8 = Math.max(-1 * Math.abs(type - 8)+1, 0);
        const isCorr9 = Math.max(-1 * Math.abs(type - 9)+1, 0);

        const corr0helper0 = Math.max(-1 * Math.abs(amount - 0)+1,0);
        const corr0helperInbetween = Math.min(Math.max(-1 * Math.abs(amount - 32/2)+32/2, 0), 1);
        const corr0helperMax = Math.max(-1 * Math.abs(amount - 32)+1, 0);
        const corr0helperFunction = 2 * Math.floor((amount * time / 32)% 2)-1;

        const corr0 = corr0helper0 + corr0helperMax * -1 + corr0helperInbetween * corr0helperFunction;
        const corr1 = (2 / Math.PI) * Math.asin(Math.cos(amount * time / 32));
        const corr2 = (amount * time / 32 - 1)%2 - 1;
        const corr3 = Math.min(Math.max(Math.tan(amount * time / 32 + 90),-1),1);
        sample = isCorr0*corr0*sample + isCorr1*corr1*sample + isCorr2*corr2*sample + isCorr3*corr3*sample + isCorr4*corr4*sample;
    `
}

interface EffectPlugin {
    pluginName: string,
    variableNames: string[],
    sliders: Slider[], //max 64
    delayLineSize: number,
    instrumentStateFunction: string,
    synthFunction: string
}

interface Slider {
    max: number, //max 64
    name: string
}