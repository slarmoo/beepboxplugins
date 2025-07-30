const effectPlugin: EffectPlugin = {
    pluginName: "sustain",
    sliders: [
        {
            max: 16,
            name: "Sustain"
        },
        {
            max: 32,
            name: "Sustain Vol"
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
        const sustainDecay = instrument.pluginValues[0];
        this.pluginDelayLineSize = Math.pow(2, sustainDecay);
        this.pluginValues[0] = this.pluginDelayLineSize;
        this.pluginValues[1] = instrument.pluginValues[1];
        this.pluginValues[2] = this.pluginValues[2] || 0;
    `,
    //the names of variables in your synth function whose values come from the instrumentStateFunction
    variableNames: ["sustainDecay", "sustainVol", "sustainDelayLinePosition"], 

    synthFunction: `
        sustainDelayLinePosition = sustainDelayLinePosition & (sustainDecay - 1);
        const sustainMix = sustainVol / 64
        const sustainSample = pluginDelayLine[sustainDelayLinePosition] * sustainMix;
        pluginDelayLine[sustainDelayLinePosition] = sample;
        sample += sustainSample;
        sustainDelayLinePosition++;
    `
}

const blob = new Blob([JSON.stringify(effectPlugin)], { type: "text/plain" });
const url = URL.createObjectURL(blob);

const a = document.getElementById("download") as HTMLAnchorElement;
if (a != null) {
    a.href = url;
}

const b = document.getElementById("copy") as HTMLAnchorElement;
if (b != null) {
    b.addEventListener("click", () => {
        navigator.clipboard.writeText(JSON.stringify(effectPlugin));
        console.log("copied!");
    });
}

interface EffectPlugin {
    pluginName: string,
    sliders: Slider[], //max 64
    effectOrderIndex: number,
    delayLineSize: number,
    instrumentStateFunction: string,
    variableNames: string[],
    synthFunction: string
}

interface Slider {
    max: number, //max 64
    name: string
}