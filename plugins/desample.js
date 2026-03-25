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

// pluginSource/Desample.ts
var import_beepboxplugin = __toESM(require_dist());
var pluginName = "desample";
var DesamplePlugin = class extends import_beepboxplugin.BeepBoxEffectPlugin {
  constructor() {
    super(...arguments);
    this.pluginName = pluginName;
    this.about = "A type of bitcrush where less and less points are used in the waveform";
    this.elements = [
      {
        type: import_beepboxplugin.PluginElementType.slider,
        initialValue: 2,
        max: 16,
        name: "Desample",
        info: "The distance between points that are interpolated between. More desample results in a less and less recognizable sound",
        hasEnvelope: false
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
    this.initializeDelayLines = /* @__PURE__ */ __name((samplesPerTick, samplesPerSecond) => {
    }, "initializeDelayLines");
    //@ts-ignore
    this.instrumentStateFunction = /* @__PURE__ */ __name((pluginStarts, pluginEnds, samplesPerTick) => {
      const desampleRate = pluginStarts[0];
      this.desampleRate = Math.pow(2, desampleRate);
    }, "instrumentStateFunction");
    //@ts-ignore
    this.synthFunction = /* @__PURE__ */ __name((samples, runLength) => {
      let sample = samples;
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
export {
  DesamplePlugin as default
};
