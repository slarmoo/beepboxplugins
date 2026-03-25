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
    var BeepBoxEffectPlugin2 = class {
      static {
        __name(this, "BeepBoxEffectPlugin");
      }
      /**
       * If your plugin uses delay lines and you would like your sound to sustain past the note, change this value to your sustain length
       */
      delayLineLength = 0;
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

// pluginSource/Sustain.ts
var import_beepboxplugin = __toESM(require_dist());
var pluginName = "sustain";
var SustainPlugin = class extends import_beepboxplugin.BeepBoxEffectPlugin {
  constructor() {
    super(...arguments);
    this.pluginName = pluginName;
    this.about = "Holds out the sound for a bit longer by copying and offsetting the waveform";
    this.elements = [
      {
        type: import_beepboxplugin.PluginElementType.slider,
        initialValue: 8,
        max: 16,
        name: "Sustain",
        info: "How long the sustain is, from barely a few milliseconds to several beats",
        hasEnvelope: false
      },
      {
        type: import_beepboxplugin.PluginElementType.slider,
        initialValue: 16,
        max: 32,
        name: "Sustain Vol",
        info: "How audible the sustain is",
        hasEnvelope: true
      }
    ];
    this.effectOrderIndex = 4;
    this.sustainDecay = Math.pow(2, 8);
    this.sustainVol = 16;
    this.sustainVolDelta = 0;
    this.sustainDelayLine = null;
    this.sustainDelayLinePosition = 0;
    this.reset = /* @__PURE__ */ __name(() => {
      this.sustainDelayLinePosition = 0;
      if (this.sustainDelayLine) for (let i = 0; i < this.sustainDecay; i++) this.sustainDelayLine[i] = 0;
    }, "reset");
    //@ts-ignore
    this.initializeDelayLines = /* @__PURE__ */ __name((samplesPerTick, samplesPerSecond) => {
      if ((!this.sustainDelayLine || this.sustainDelayLine.length < this.sustainDecay) && this.sustainDecay > 0) {
        this.sustainDelayLine = new Float32Array(this.sustainDecay);
      }
    }, "initializeDelayLines");
    this.instrumentStateFunction = /* @__PURE__ */ __name((pluginStarts, pluginEnds, samplesPerTick) => {
      const sustainDecay = pluginStarts[0];
      this.sustainDecay = Math.pow(2, sustainDecay);
      this.sustainVol = pluginStarts[1];
      this.sustainVolDelta = (pluginEnds[1] - pluginStarts[1]) / samplesPerTick;
    }, "instrumentStateFunction");
    //@ts-ignore
    this.synthFunction = /* @__PURE__ */ __name((samples, runLength) => {
      let sample = samples;
      if (this.sustainDecay == 0 || !this.sustainDelayLine) return sample;
      this.sustainDelayLinePosition = this.sustainDelayLinePosition & this.sustainDecay - 1;
      const sustainSample = this.sustainDelayLine[this.sustainDelayLinePosition] * this.sustainVol / 64;
      this.sustainDelayLine[this.sustainDelayLinePosition] = sample;
      sample += sustainSample;
      this.sustainDelayLinePosition++;
      this.sustainVol += this.sustainVolDelta;
      return sample;
    }, "synthFunction");
  }
  static {
    __name(this, "SustainPlugin");
  }
};
export {
  SustainPlugin as default
};
