const effectPlugin: EffectPlugin = {
    pluginName: "corruption",
    sliders: [
        {
            max: 32,
            name: "Corruption"
        },
        {
            max: 3,
            name: "Corrupt #"
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
        if(this.pluginValues[2] > 1024 || this.pluginValues[2] == undefined) this.pluginValues[2] = 0;
        this.pluginValues[0] = instrument.pluginValues[0];
        this.pluginValues[1] = instrument.pluginValues[1];
        this.pluginValues[2] = this.pluginValues[2] + 0.01;
    `,
    //the names of variables in your synth function whose values come from the instrumentStateFunction
    variableNames: ["corruptionAmount", "corruptionType", "corruptionTime"], 

    synthFunction: `
        const isCorr0 = Math.max(-1 * Math.abs(corruptionType - 0)+1, 0);
        const isCorr1 = Math.max(-1 * Math.abs(corruptionType - 1)+1, 0);
        const isCorr2 = Math.max(-1 * Math.abs(corruptionType - 2)+1, 0);
        const isCorr3 = Math.max(-1 * Math.abs(corruptionType - 3)+1, 0);
        // const isCorr4 = Math.max(-1 * Math.abs(corruptionType - 4)+1, 0);
        // const isCorr5 = Math.max(-1 * Math.abs(corruptionType - 5)+1, 0);
        // const isCorr6 = Math.max(-1 * Math.abs(corruptionType - 6)+1, 0);
        // const isCorr7 = Math.max(-1 * Math.abs(corruptionType - 7)+1, 0);
        // const isCorr8 = Math.max(-1 * Math.abs(corruptionType - 8)+1, 0);
        // const isCorr9 = Math.max(-1 * Math.abs(corruptionType - 9)+1, 0);

        const corr0helper0 = Math.max(-1 * Math.abs(corruptionAmount - 0)+1,0);
        const corr0helperInbetween = Math.min(Math.max(-1 * Math.abs(corruptionAmount - 32/2)+32/2, 0), 1);
        const corr0helperMax = Math.max(-1 * Math.abs(corruptionAmount - 32)+1, 0);
        const corr0helperFunction = 2 * Math.floor((corruptionAmount * corruptionTime / 32)% 2)-1;

        const corr0 = corr0helper0 + corr0helperMax * -1 + corr0helperInbetween * corr0helperFunction;
        const corr1 = (2 / Math.PI) * Math.asin(Math.cos(corruptionAmount * corruptionTime / 32));
        const corr2 = (corruptionAmount * corruptionTime / 32 - 1)%2 - 1;
        const corr3 = Math.min(Math.max(Math.tan(corruptionAmount * corruptionTime / 32 + 90),-1),1);
        sample = isCorr0*corr0*sample + isCorr1*corr1*sample + isCorr2*corr2*sample + isCorr3*corr3*sample;
    `
}

const blob = new Blob([JSON.stringify(effectPlugin)], { type: "text/plain" });
const url = URL.createObjectURL(blob);

const a = document.getElementById("download") as HTMLAnchorElement;
if (a != null) {
    a.href = url;
    // a.addEventListener("click", () => URL.revokeObjectURL(url));
}


interface EffectPlugin {
    pluginName: string,
    sliders: Slider[], //max 64
    delayLineSize: number,
    instrumentStateFunction: string,
    variableNames: string[],
    synthFunction: string
}

interface Slider {
    max: number, //max 64
    name: string
}