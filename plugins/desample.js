var __defProp = Object.defineProperty;
var __name = (target, value) => __defProp(target, "name", { value, configurable: true });

// pluginSource/plugin.ts
var EffectPlugin = class {
  static {
    __name(this, "EffectPlugin");
  }
  ping() {
    console.log("pong!");
  }
  constructor() {
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
        max: 16,
        name: "Desample"
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
