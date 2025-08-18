const effectPlugin: EffectPlugin = {
    pluginName: "corruption",
    about: "Applies corrupting transformations to the waveform",
    // see below for element structure
    elements: [
        {
            type: "slider",
            max: 32,
            name: "Corruption"
        },
        {
            type: "dropdown",
            options: [
                "Invert chunks",
                "Asin",
                "Engine",
                "Buzz"
            ],
            name: "Corrupt type"
        }
    ],
    /* when the effect runs in the effect order. It inserts at that index, and moves all other effects down one. 
        current order: 
        0. granular
        1. Distortion
        2. Bitcrusher
        3. Ring Modulation
        4. EQ filter
        5. Panning //after panning you must read from and write to sampleL and sampleR instead of sample
        6. Chorus
        7. Echo
        8. Reverb
    */
    effectOrderIndex: 4, 
    // there is a pluginDelayLine available to use if desired,
    // but you must set the size here to something other than 0 if you wish to use it
    // it can be later updated in the instrumentStateFunction by setting this.pluginDelayLineSize
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
        this.pluginValues[2] = this.pluginValues[2] + 1;
    `,
    // the names of variables in your synth function whose values come from the instrumentStateFunction
    variableNames: [
        "corruptionAmount",
        "corruptionType",
        "corruptionTime"
    ], 

    // the per sample calculations.
    // your inputs are the variable names above and a sample (or sampleL and sampleR if after panning)
    // your outputs are sample (or sampleL and sampleR if after panning)
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
        const corr2 = (corruptionAmount * corruptionTime / 32 - 1)%2 * - 1;
        const corr3 = -1 * Math.min(Math.max(Math.tan(corruptionAmount * corruptionTime / 32 + 90),-1),1);
        sample = isCorr0*corr0*sample + isCorr1*corr1*sample + isCorr2*corr2*sample + isCorr3*corr3*sample;
        corruptionTime+= 1/runLength;
    `
}

const blob = new Blob([JSON.stringify(effectPlugin)], { type: "text/plain" });
const url = URL.createObjectURL(blob);

const a = document.getElementById("download") as HTMLAnchorElement;
const b = document.getElementById("copy") as HTMLAnchorElement;

if ((window.location + "").indexOf("localhost:5173") < 0) {
    if (a != null) a.style.display = "none";
    if (b != null) b.style.display = "none";
} else {
    if (a != null) a.href = url;

    if (b != null) {
        b.addEventListener("click", () => {
            navigator.clipboard.writeText(JSON.stringify(effectPlugin));
            console.log("copied!");
        });
    }
}

interface EffectPlugin {
    pluginName: string,
    about: string,
    elements: Element[], //max 64
    effectOrderIndex: number,
    delayLineSize: number,
    instrumentStateFunction: string,
    variableNames: string[],
    synthFunction: string
}

interface ElementRoot {
    type: string,
    name: string
}
type Element = Slider | Checkbox | Dropdown | ElementRoot;

interface Slider extends ElementRoot {
    type: "slider",
    max: number, //max 64
    //mod interaction?
}

interface Checkbox extends ElementRoot {
    type: "checkbox"
}

interface Dropdown extends ElementRoot {
    type: "dropdown",
    options: string[] //max 64
}