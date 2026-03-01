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

// pluginSource/Corruption.ts
var pluginName = "corruption";
var CorruptionPlugin = class extends EffectPlugin {
  constructor() {
    super(...arguments);
    this.pluginName = pluginName;
    this.about = "Applies corrupting transformations to the waveform";
    this.elements = [
      {
        type: 0 /* slider */,
        initialValue: 3,
        max: 32,
        name: "Corruption",
        info: "How much corruption is applied",
        hasEnvelope: true
      },
      {
        type: 2 /* dropdown */,
        initialValue: 1,
        options: [
          "Invert chunks",
          "Asin",
          "Engine",
          "Buzz"
        ],
        name: "Corrupt type",
        info: "The type of corruption applied. Note that invert chunks at max value simply inverts the wave"
      }
    ];
    this.effectOrderIndex = 4;
    //@ts-ignore
    this.initializeDelayLines = /* @__PURE__ */ __name((samplesPerTick) => {
    }, "initializeDelayLines");
    this.corruptionAmount = 0;
    this.corruptionDelta = 0;
    this.corruptionType = 0;
    this.corruptionTime = 0;
    this.reset = /* @__PURE__ */ __name(() => {
      this.corruptionTime = 0;
    }, "reset");
    this.instrumentStateFunction = /* @__PURE__ */ __name((pluginStarts, pluginEnds) => {
      if (this.corruptionTime > 1024) this.corruptionTime = 0;
      this.corruptionAmount = pluginStarts[0];
      this.corruptionDelta = (pluginEnds[0] - pluginStarts[0]) / sampleRate;
      this.corruptionType = pluginStarts[1];
      this.corruptionTime = this.corruptionTime + 1;
    }, "instrumentStateFunction");
    this.synthFunction = /* @__PURE__ */ __name((samples, runLength) => {
      let sample = samples;
      const isCorr0 = Math.max(-1 * Math.abs(this.corruptionType - 0) + 1, 0);
      const isCorr1 = Math.max(-1 * Math.abs(this.corruptionType - 1) + 1, 0);
      const isCorr2 = Math.max(-1 * Math.abs(this.corruptionType - 2) + 1, 0);
      const isCorr3 = Math.max(-1 * Math.abs(this.corruptionType - 3) + 1, 0);
      const corr0helper0 = Math.max(-1 * Math.abs(this.corruptionAmount - 0) + 1, 0);
      const corr0helperInbetween = Math.min(Math.max(-1 * Math.abs(this.corruptionAmount - 32 / 2) + 32 / 2, 0), 1);
      const corr0helperMax = Math.max(-1 * Math.abs(this.corruptionAmount - 32) + 1, 0);
      const corr0helperFunction = 2 * Math.floor(this.corruptionAmount * this.corruptionTime / 32 % 2) - 1;
      const corr0 = corr0helper0 + corr0helperMax * -1 + corr0helperInbetween * corr0helperFunction;
      const corr1 = 2 / Math.PI * Math.asin(Math.cos(this.corruptionAmount * this.corruptionTime / 32));
      const corr2 = (this.corruptionAmount * this.corruptionTime / 32 - 1) % 2 * -1;
      const corr3 = -1 * Math.min(Math.max(Math.tan(this.corruptionAmount * this.corruptionTime / 32 + 90), -1), 1);
      sample = isCorr0 * corr0 * sample + isCorr1 * corr1 * sample + isCorr2 * corr2 * sample + isCorr3 * corr3 * sample;
      this.corruptionTime += 1 / runLength;
      this.corruptionAmount += this.corruptionDelta;
      return sample;
    }, "synthFunction");
  }
  static {
    __name(this, "CorruptionPlugin");
  }
};
globalThis[pluginName] = CorruptionPlugin;
export {
  CorruptionPlugin as default
};
