const effectPlugin: EffectPlugin = {
    pluginName: "desample",
    sliders: [
        {
            max: 16,
            name: "Desample"
        },
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
    effectOrderIndex: 1, 
    // there is a pluginDelayLine available to use if desired,
    // but you must set the size here to something other than 0 if you wish to use it
    // it can be later updated in the instrumentStateFunction by setting this.pluginDelayLineSize
    delayLineSize: 2,

    // here you may edit values and create new ones, 
    // but you must grab values from instrument.pluginValues[#] 
    // (where # corresponds to the index of your slider),
    // and place values into this.pluginValues[#]
    // (where # corresponds to the index of the variableName)
    instrumentStateFunction: ` 
        const desampleRate = instrument.pluginValues[0];
        this.pluginValues[0] = Math.pow(2, desampleRate);
        this.pluginValues[1] = this.pluginValues[1] || 0;
    `,
    //the names of variables in your synth function whose values come from the instrumentStateFunction
    variableNames: ["desampleRate", "desampleTime"], 

    synthFunction: `
        desampleTime = desampleTime & (desampleRate - 1);
        if(desampleTime == 0) {
            //index 0 for from value, index 1 for 2 value
            this.pluginDelayLine[0] = this.pluginDelayLine[1];
            this.pluginDelayLine[1] = sample;
        }
        sample = (desampleTime / desampleRate) * this.pluginDelayLine[0] + ((desampleRate - desampleTime) / desampleRate) * this.pluginDelayLine[1];
        desampleTime++;
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