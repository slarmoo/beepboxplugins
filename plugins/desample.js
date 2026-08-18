var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __name = (target, value) => __defProp(target, "name", { value, configurable: true });
var __commonJS = (cb, mod) => function __require() {
  try {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  } catch (e) {
    throw mod = 0, e;
  }
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

// node_modules/beepboxplugin/dist/helpers.js
var require_helpers = __commonJS({
  "node_modules/beepboxplugin/dist/helpers.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.DelayLine = void 0;
    var epsilon = 1e-20;
    var DelayLine = class {
      static {
        __name(this, "DelayLine");
      }
      samples;
      index = 0;
      _length;
      _hasBeenEmptied = true;
      constructor(delayLineSize) {
        this.samples = new Float32Array(delayLineSize);
        this._length = delayLineSize;
        this.index = 0;
      }
      /**
       * How long the delay line is
       */
      get length() {
        return this._length;
      }
      /**
       * Resets the delay line
       */
      empty() {
        if (this._hasBeenEmptied)
          return;
        this.index = 0;
        for (let i = 0; i < this._length; i++)
          this.samples[i] = 0;
        this._hasBeenEmptied = true;
        this.oldLength = 0;
      }
      /**
       * Read a sample from the delay line.
       * @returns a sample
       */
      read() {
        return this.samples[this.index] || 0;
      }
      /**
       * Write a sample to the delay line and increment the sample pointer
       * @param sample the sample to write
       */
      write(sample) {
        if (this.oldLength > 0 && this.newSamples)
          this.newSamples[this.index] = this.sanitize(sample);
        else
          this.samples[this.index] = this.sanitize(sample);
        this.index++;
        if (this.index >= this.samples.length)
          this.index = 0;
        this._hasBeenEmptied = false;
        if (this.newSamples && this.oldLength <= 0) {
          this.samples = this.newSamples;
          this.newSamples = null;
        } else {
          this.oldLength--;
        }
      }
      newSamples = null;
      oldLength = 0;
      /**
       * Update how big the delay line is
       * @param delayLineSize the new delay line length
       */
      resizeDelayLine(delayLineSize) {
        if (this._hasBeenEmptied || delayLineSize < this._length) {
          this.samples = new Float32Array(delayLineSize);
          this._length = delayLineSize;
          this.index = 0;
        } else {
          this.oldLength = this._length;
          this.newSamples = new Float32Array(delayLineSize);
          this._length = delayLineSize;
        }
      }
      sanitize(sample) {
        if (Number.isFinite(sample) && Math.abs(sample) >= epsilon)
          return sample;
        return 0;
      }
    };
    exports.DelayLine = DelayLine;
  }
});

// node_modules/beepboxplugin/dist/index.js
var require_dist = __commonJS({
  "node_modules/beepboxplugin/dist/index.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.DelayLine = exports.PluginCustomUI = exports.PluginElementType = exports.BeepBoxEffectPlugin = void 0;
    var BeepBoxEffectPlugin2 = class {
      static {
        __name(this, "BeepBoxEffectPlugin");
      }
      /**
       * If your plugin has any presets, you may list the names/jsons here
       */
      presets = [];
      /**
       * If your plugin uses delay lines and you would like your sound to sustain past the note, change this value to your sustain length
       */
      delayLineLength = 0;
      /**
       *
       * @param effect The default effect number (See effectOrderIndex)
       * @param panningIndex The default effect number for panning
       * @param panningIndex The default effect number for plugins
       * @returns Whether or not the effect happens before panning
       */
      effectIsBeforePanning(effect, panningIndex, defaultPluginIndex) {
        if (typeof this.effectOrderIndex == "number") {
          if (effect == defaultPluginIndex) {
            return this.effectOrderIndex < panningIndex;
          } else {
            return effect < panningIndex + +this.effectIsBeforePanning(defaultPluginIndex, panningIndex, defaultPluginIndex);
          }
        } else {
          const truePanningIndex = this.effectOrderIndex.indexOf(panningIndex);
          const otherIndex = this.effectOrderIndex.indexOf(effect);
          if (otherIndex < 0)
            throw RangeError(`Effect #${effect} is not in effects list`);
          return otherIndex < truePanningIndex;
        }
      }
      /**
       * Verifies that effectOrderIndex is valid
       */
      verifyEffectOrderIndex(defaultPluginIndex) {
        if (typeof this.effectOrderIndex == "number") {
          if (this.effectOrderIndex < 0 || this.effectOrderIndex > defaultPluginIndex)
            throw RangeError(`Index ${this.effectOrderIndex} is not a valid index value`);
        } else {
          const s = new Set(this.effectOrderIndex);
          if (s.size < this.effectOrderIndex.length)
            throw RangeError(`Duplicate effect indices`);
          if (s.size > this.effectOrderIndex.length)
            throw RangeError(`Too many effect indices`);
          this.effectOrderIndex.forEach((v, i) => {
            if (v < 0 || v > defaultPluginIndex)
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
      PluginElementType3[PluginElementType3["custom"] = 3] = "custom";
    })(PluginElementType2 || (exports.PluginElementType = PluginElementType2 = {}));
    var PluginCustomUI = class {
      static {
        __name(this, "PluginCustomUI");
      }
      updateSynth;
      type = PluginElementType2.custom;
      initialValue = 0;
      //initial value has no meaning here
      /**
       * @param updateSynth Update the instrument with the value of the plugin.
       * pluginValueIndex corresponds to the same index that you'll draw the value out of in your instrumentStateFunction
       *
       * For example, if you have an x/y grid and you can plot two points, and have a checkbox and a dropdown that happen before this, then
       *
       * checkbox -> 0
       *
       * dropdown -> 1
       *
       * x1 -> 2
       *
       * y1 -> 3
       *
       * x2 -> 4
       *
       * y2 -> 5
       */
      constructor(updateSynth) {
        this.updateSynth = updateSynth;
      }
    };
    exports.PluginCustomUI = PluginCustomUI;
    var helpers_1 = require_helpers();
    Object.defineProperty(exports, "DelayLine", { enumerable: true, get: /* @__PURE__ */ __name(function() {
      return helpers_1.DelayLine;
    }, "get") });
  }
});

// pluginSource/Desample.ts
var import_beepboxplugin = __toESM(require_dist());
var DesamplePlugin = class extends import_beepboxplugin.BeepBoxEffectPlugin {
  constructor() {
    super(...arguments);
    this.pluginName = "desample";
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
