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

// pluginSource/Desample.ts
var pluginName = "desample";
var DesamplePlugin = class extends EffectPlugin {
  constructor() {
    super(...arguments);
    this.pluginName = pluginName;
    this.about = "A type of bitcrush where less and less points are used in the waveform";
    this.elements = [
      {
        type: "slider",
        initialValue: 0,
        max: 16,
        name: "Desample",
        info: "The distance between points that are interpolated between. More desample results in a less and less recognizable sound"
      }
    ];
    this.effectOrderIndex = 1;
    this.desampleRate = 0;
    this.desampleTime = 0;
    this.reset = /* @__PURE__ */ __name(() => {
      this.desampleTime = 0;
      this.delayLine[0] = 0;
      this.delayLine[1] = 0;
    }, "reset");
    this.delayLine = new Float32Array(2);
    //@ts-ignore
    this.initializeDelayLines = /* @__PURE__ */ __name((samplesPerTick) => {
    }, "initializeDelayLines");
    this.instrumentStateFunction = /* @__PURE__ */ __name((instrument) => {
      const desampleRate = instrument.pluginValues[0];
      this.desampleRate = Math.pow(2, desampleRate);
    }, "instrumentStateFunction");
    //@ts-ignore
    this.synthFunction = /* @__PURE__ */ __name((sample, runLength) => {
      this.desampleTime = this.desampleTime & this.desampleRate - 1;
      if (this.desampleTime == 0) {
        this.delayLine[0] = this.delayLine[1];
        this.delayLine[1] = sample;
      }
      sample = this.desampleTime / this.desampleRate * this.delayLine[0] + (this.desampleRate - this.desampleTime) / this.desampleRate * this.delayLine[1];
      this.desampleTime++;
      return sample;
    }, "synthFunction");
  }
  static {
    __name(this, "DesamplePlugin");
  }
};
globalThis[pluginName] = DesamplePlugin;
export {
  DesamplePlugin as default
};
