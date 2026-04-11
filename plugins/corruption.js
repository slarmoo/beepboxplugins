var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __name = (target, value) => __defProp(target, "name", { value, configurable: true });
var __commonJS = (cb, mod) => function __require() {
  return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  // If the importer is in node compatibility mode or this is not an ESM
  // file that has been converted to a CommonJS file using a Babel-
  // compatible transform (i.e. "__esModule" has not been set), then set
  // "default" to the CommonJS "module.exports" for node compatibility.
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));

// node_modules/beepboxplugin/dist/index.js
var require_dist = __commonJS({
  "node_modules/beepboxplugin/dist/index.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.PluginElementType = exports.BeepBoxEffectPlugin = void 0;
    var PANNING_INDEX = 5;
    var PLUGIN_INDEX = 9;
    var BeepBoxEffectPlugin2 = class {
      static {
        __name(this, "BeepBoxEffectPlugin");
      }
      /**
       * If your plugin uses delay lines and you would like your sound to sustain past the note, change this value to your sustain length
       */
      delayLineLength = 0;
      /**
       *
       * @param effect The default effect number (See effectOrderIndex)
       * @returns Whether or not the effect happens before panning
       */
      effectIsBeforePanning(effect) {
        if (typeof this.effectOrderIndex == "number") {
          if (effect == PLUGIN_INDEX) {
            return this.effectOrderIndex < PANNING_INDEX;
          } else {
            return effect < 5 + +this.effectIsBeforePanning(PLUGIN_INDEX);
          }
        } else {
          const panningIndex = this.effectOrderIndex.indexOf(PANNING_INDEX);
          const otherIndex = this.effectOrderIndex.indexOf(effect);
          if (otherIndex < 0)
            throw RangeError(`Effect #${effect} is not in effects list`);
          return otherIndex < panningIndex;
        }
      }
      /**
       * Verifies that effectOrderIndex is valid
       */
      verifyEffectOrderIndex() {
        if (typeof this.effectOrderIndex == "number") {
          if (this.effectOrderIndex < 0 || this.effectOrderIndex > PLUGIN_INDEX)
            throw RangeError(`Index ${this.effectOrderIndex} is not a valid index value`);
        } else {
          const s = new Set(this.effectOrderIndex);
          if (s.size < this.effectOrderIndex.length)
            throw RangeError(`Duplicate effect indices`);
          if (s.size > this.effectOrderIndex.length)
            throw RangeError(`Too many effect indices`);
          this.effectOrderIndex.forEach((v, i) => {
            if (v < 0 || v > PLUGIN_INDEX)
              throw RangeError(`Index ${v} is not a valid index value at position ${i}`);
          });
        }
      }
      /**
       * For testing
       */
      ping() {
        console.log("pong!");
      }
    };
    exports.BeepBoxEffectPlugin = BeepBoxEffectPlugin2;
    var PluginElementType2;
    (function(PluginElementType3) {
      PluginElementType3[PluginElementType3["slider"] = 0] = "slider";
      PluginElementType3[PluginElementType3["checkbox"] = 1] = "checkbox";
      PluginElementType3[PluginElementType3["dropdown"] = 2] = "dropdown";
    })(PluginElementType2 || (exports.PluginElementType = PluginElementType2 = {}));
  }
});

// pluginSource/Corruption.ts
var import_beepboxplugin = __toESM(require_dist());
var pluginName = "corruption";
var CorruptionPlugin = class extends import_beepboxplugin.BeepBoxEffectPlugin {
  constructor() {
    super(...arguments);
    this.pluginName = pluginName;
    this.about = "Applies corrupting transformations to the waveform";
    this.elements = [
      {
        type: import_beepboxplugin.PluginElementType.slider,
        initialValue: 3,
        max: 32,
        name: "Corruption",
        info: "How much corruption is applied",
        hasEnvelope: true
      },
      {
        type: import_beepboxplugin.PluginElementType.dropdown,
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
    this.initializeDelayLines = /* @__PURE__ */ __name((samplesPerTick, samplesPerSecond) => {
    }, "initializeDelayLines");
    this.corruptionAmount = 0;
    this.corruptionDelta = 0;
    this.corruptionType = 0;
    this.corruptionTime = 0;
    this.reset = /* @__PURE__ */ __name(() => {
      this.corruptionTime = 0;
    }, "reset");
    this.instrumentStateFunction = /* @__PURE__ */ __name((pluginStarts, pluginEnds, samplesPerTick) => {
      if (this.corruptionTime > 1024) this.corruptionTime = 0;
      this.corruptionAmount = pluginStarts[0];
      this.corruptionDelta = (pluginEnds[0] - pluginStarts[0]) / samplesPerTick;
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
export {
  CorruptionPlugin as default
};
