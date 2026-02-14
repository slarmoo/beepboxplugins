var __defProp = Object.defineProperty;
var __name = (target, value) => __defProp(target, "name", { value, configurable: true });

// pluginSource/plugin.ts
var EffectPlugin = class {
  constructor() {
    /**
     * If your plugin uses delay lines and you would like your sound to sustain, change this value to your sustain length
     */
    this.delayLineLength = 0;
  }
  static {
    __name(this, "EffectPlugin");
  }
  /**
   * For testing
   */
  ping() {
    console.log("pong!");
  }
};

// pluginSource/Sustain.ts
var pluginName = "sustain";
var SustainPlugin = class extends EffectPlugin {
  constructor() {
    super(...arguments);
    this.pluginName = pluginName;
    this.about = "Holds out the sound for a bit longer by copying and offsetting the waveform";
    this.elements = [
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
    this.effectOrderIndex = 4;
    this.sustainDecay = 0;
    this.sustainVol = 0;
    this.sustainDelayLine = null;
    this.sustainDelayLinePosition = 0;
    this.reset = /* @__PURE__ */ __name(() => {
      this.sustainDelayLinePosition = 0;
      if (this.sustainDelayLine) for (let i = 0; i < this.sustainDecay; i++) this.sustainDelayLine[i] = 0;
    }, "reset");
    //@ts-ignore
    this.initializeDelayLines = /* @__PURE__ */ __name((samplesPerTick) => {
      if ((!this.sustainDelayLine || this.sustainDelayLine.length < this.sustainDecay) && this.sustainDecay > 0) {
        this.sustainDelayLine = new Float32Array(this.sustainDecay);
      }
    }, "initializeDelayLines");
    this.instrumentStateFunction = /* @__PURE__ */ __name((instrument) => {
      const sustainDecay = instrument.pluginValues[0];
      this.sustainDecay = Math.pow(2, sustainDecay);
      this.sustainVol = instrument.pluginValues[1];
    }, "instrumentStateFunction");
    //@ts-ignore
    this.synthFunction = /* @__PURE__ */ __name((sample, runLength) => {
      if (this.sustainDecay == 0 || !this.sustainDelayLine) return sample;
      this.sustainDelayLinePosition = this.sustainDelayLinePosition & this.sustainDecay - 1;
      const sustainSample = this.sustainDelayLine[this.sustainDelayLinePosition] * this.sustainVol / 64;
      this.sustainDelayLine[this.sustainDelayLinePosition] = sample;
      sample += sustainSample;
      this.sustainDelayLinePosition++;
      return sample;
    }, "synthFunction");
  }
  static {
    __name(this, "SustainPlugin");
  }
};
globalThis[pluginName] = SustainPlugin;
export {
  SustainPlugin as default
};
