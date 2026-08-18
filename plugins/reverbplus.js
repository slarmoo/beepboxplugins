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
    var DelayLine2 = class {
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
        this.inc();
        this._hasBeenEmptied = false;
        if (this.newSamples && this.oldLength <= 0) {
          this.samples = this.newSamples;
          this.newSamples = null;
        } else {
          this.oldLength--;
        }
      }
      inc() {
        this.index++;
        if (this.index >= this.samples.length)
          this.index = 0;
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
    exports.DelayLine = DelayLine2;
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

// pluginSource/ReverbPlus.ts
var import_beepboxplugin = __toESM(require_dist());
function houseHolder(samples) {
  let sum = 0;
  for (const val of samples) {
    sum += val;
  }
  sum *= 2 / samples.length;
  for (let i = 0; i < samples.length; i++) {
    samples[i] -= sum;
  }
}
__name(houseHolder, "houseHolder");
function hamarand(samples) {
  let prevI = 1;
  for (let i = 2; i <= samples.length; i <<= 1) {
    for (let j = 0; j < samples.length; j += i) {
      const a = samples[j];
      const b = samples[j + prevI];
      samples[j] = a + b;
      samples[j + prevI] = a - b;
    }
    prevI = i;
  }
  const scalingFactor = Math.sqrt(1 / samples.length);
  for (let i = 0; i < samples.length; i++) {
    samples[i] *= scalingFactor;
  }
}
__name(hamarand, "hamarand");
var MultichannelMixedFeedback = class {
  constructor(channels, delayMs = 150, decayGain = 0.85) {
    this.channels = channels;
    this.delayMs = delayMs;
    this.decayGain = decayGain;
    this.delaySamples = [];
    this.delays = [];
    this.delayed = new Float32Array(this.channels);
    this.mixed = new Float32Array(this.channels);
    this.dark = 1;
  }
  static {
    __name(this, "MultichannelMixedFeedback");
  }
  initializeDelayLines(sampleRate) {
    const delayBase = this.delayMs * 1e-3 * sampleRate;
    for (let i = 0; i < this.channels; i++) {
      this.delaySamples[i] = Math.floor(Math.pow(2, i / this.channels) * delayBase);
      if (!this.delays[i]) {
        this.delays[i] = new import_beepboxplugin.DelayLine(this.delaySamples[i]);
      } else {
        this.delays[i].resizeDelayLine(this.delaySamples[i]);
      }
      this.mixed[i] = 0;
    }
  }
  reset() {
    for (let i = 0; i < this.channels; i++) {
      this.delays[i].empty();
      this.delayed[i] = 0;
      this.mixed[i] = 0;
    }
  }
  process(input) {
    for (let i = 0; i < this.channels; i++) {
      this.delayed[i] = this.delays[i].read();
      this.mixed[i] += this.dark * (this.delayed[i] - this.mixed[i]);
      ;
    }
    houseHolder(this.mixed);
    for (let i = 0; i < this.channels; i++) {
      this.delays[i].write(input[i] + this.mixed[i] * this.decayGain);
    }
    return this.delayed;
  }
};
var DiffusionStep = class {
  constructor(channels) {
    this.channels = channels;
    this.delaySamples = [];
    this.delays = [];
    this.flips = [];
    this.delayMsRange = -1;
    this.delayed = new Float32Array(this.channels);
    for (let i = 0; i < this.channels; i++) {
      this.flips[i] = Math.round(Math.random()) == 1;
    }
  }
  static {
    __name(this, "DiffusionStep");
  }
  initializeDelayLines(sampleRate, delayMsRange = 50) {
    if (this.delayMsRange != delayMsRange) {
      this.delayMsRange = delayMsRange;
      const delaySamplesRange = this.delayMsRange * 1e-3 * sampleRate;
      for (let i = 0; i < this.channels; i++) {
        const rangeLow = delaySamplesRange * i / this.channels;
        const rangeHigh = delaySamplesRange * (i + 1) / this.channels;
        this.delaySamples[i] = Math.floor(Math.random() * (rangeHigh - rangeLow) + rangeLow);
      }
    }
    for (let i = 0; i < this.channels; i++) {
      if (!this.delays[i]) {
        this.delays[i] = new import_beepboxplugin.DelayLine(this.delaySamples[i]);
      } else {
        this.delays[i].resizeDelayLine(this.delaySamples[i]);
      }
    }
  }
  reset() {
    for (let i = 0; i < this.channels; i++) {
      this.delays[i].empty();
      this.flips[i] = Math.round(Math.random()) == 1;
      this.delayed[i] = 0;
    }
  }
  process(input) {
    for (let i = 0; i < this.channels; i++) {
      if (!this.delays[i]) return input;
      this.delayed[i] = this.delays[i].read();
      this.delays[i].write(input[i]);
    }
    hamarand(this.delayed);
    for (let i = 0; i < this.channels; i++) {
      if (this.flips[i]) this.delayed[i] *= -1;
    }
    return this.delayed;
  }
};
var DiffuserHalfLengths = class {
  constructor(channels, stepCount, diffusion = 50) {
    this.channels = channels;
    this.stepCount = stepCount;
    this.diffusion = diffusion;
    this.diffusionSteps = [];
    this.reset();
  }
  static {
    __name(this, "DiffuserHalfLengths");
  }
  reset() {
    for (let i = 0; i < this.stepCount; i++) {
      if (this.diffusionSteps[i]) this.diffusionSteps[i].reset();
    }
  }
  initializeDelayLines(sampleRate) {
    let delayMS = this.diffusion;
    for (let i = 0; i < this.stepCount; i++) {
      if (!this.diffusionSteps[i]) this.diffusionSteps[i] = new DiffusionStep(this.channels);
      this.diffusionSteps[i].initializeDelayLines(sampleRate, delayMS);
      delayMS /= 2;
    }
  }
  process(input) {
    if (this.diffusionSteps.length != this.stepCount) return input;
    for (let i = 0; i < this.stepCount; i++) {
      input = this.diffusionSteps[i].process(input);
    }
    return input;
  }
};
var ReverbPlusPlugin = class _ReverbPlusPlugin extends import_beepboxplugin.BeepBoxEffectPlugin {
  constructor() {
    super(...arguments);
    this.pluginName = "reverb+";
    this.about = "A better implementation of reverb based on the ADC talk found here: https://youtu.be/6ZK2Goiyotk?si=HpSDjgY5dtoMC-y6";
    this.channels = 8;
    this.diffusionSteps = 4;
    this.roomSizeMs = 150;
    this.rt60 = 10;
    this.wet = 1;
    this.brightness = 0.2;
    this.wetDelta = 0;
    this.brightDelta = 0;
    this.diffusion = 50;
    this.feedback = null;
    this.diffuser = null;
    this.elements = [
      {
        type: import_beepboxplugin.PluginElementType.slider,
        initialValue: _ReverbPlusPlugin.wetMax,
        max: _ReverbPlusPlugin.wetMax,
        name: "Reverb+",
        info: "The dry/wet mix of the reverb+ plugin",
        hasEnvelope: true
      },
      {
        type: import_beepboxplugin.PluginElementType.slider,
        initialValue: 2,
        max: 10,
        name: "Brightness",
        info: "How bright the sound is. Lower values result in a darker tone",
        hasEnvelope: true
      },
      {
        type: import_beepboxplugin.PluginElementType.slider,
        initialValue: 5,
        max: 8,
        name: "Room Size",
        info: "How long the feedback of the reverb lasts",
        hasEnvelope: false
      },
      {
        type: import_beepboxplugin.PluginElementType.slider,
        initialValue: 5,
        max: 10,
        name: "Diffusion",
        info: "How diffuse the reverb is",
        hasEnvelope: false
      }
    ];
    this.presets = [{
      name: "Heavenly Strings",
      settings: { "type": "supersaw", "eqFilter": [{ "type": "low-pass", "cutoffHz": 19027.31, "linearGain": 0.7071 }, { "type": "peak", "cutoffHz": 9513.66, "linearGain": 0.25 }, { "type": "peak", "cutoffHz": 4e3, "linearGain": 0.3536 }, { "type": "peak", "cutoffHz": 16e3, "linearGain": 0.3536 }], "eqFilterType": false, "eqSimpleCut": 10, "eqSimplePeak": 0, "envelopeSpeed": 12, "eqSubFilters0": [{ "type": "low-pass", "cutoffHz": 19027.31, "linearGain": 0.7071 }, { "type": "peak", "cutoffHz": 9513.66, "linearGain": 0.25 }, { "type": "peak", "cutoffHz": 4e3, "linearGain": 0.3536 }, { "type": "peak", "cutoffHz": 16e3, "linearGain": 0.3536 }], "effects": ["transition type", "plugin"], "transition": "interrupt", "clicklessTransition": false, "panDelay": 0, "plugin": [16, 2, 5, 5], "fadeInSeconds": 0.0125, "fadeOutTicks": 6, "unison": "none", "pulseWidth": 50, "decimalOffset": 0, "dynamism": 100, "spread": 50, "shape": 0, "envelopes": [] }
    }, {
      name: "Dream Choir",
      settings: { "type": "spectrum", "eqFilter": [{ "type": "low-pass", "cutoffHz": 9513.66, "linearGain": 0.1768 }, { "type": "high-pass", "cutoffHz": 176.78, "linearGain": 1 }], "eqFilterType": false, "eqSimpleCut": 10, "eqSimplePeak": 0, "envelopeSpeed": 12, "eqSubFilters0": [{ "type": "low-pass", "cutoffHz": 9513.66, "linearGain": 0.1768 }, { "type": "high-pass", "cutoffHz": 176.78, "linearGain": 1 }], "effects": ["transition type", "detune", "granular", "reverb", "plugin"], "transition": "interrupt", "clicklessTransition": false, "detuneCents": 20, "granular": 4, "grainSize": 49, "grainFreq": 10, "grainRange": 40, "panDelay": 0, "reverb": 52, "plugin": [16, 10, 8, 10], "fadeInSeconds": 0.0125, "fadeOutTicks": 6, "unison": "stationary", "spectrum": [100, 0, 0, 0, 100, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], "envelopes": [] }
    }, {
      name: "Cavernous",
      settings: { "type": "FM", "eqFilter": [{ "type": "high-pass", "cutoffHz": 353.55, "linearGain": 0.5 }, { "type": "low-pass", "cutoffHz": 1189.21, "linearGain": 0.5 }, { "type": "high-pass", "cutoffHz": 176.78, "linearGain": 0.0884 }], "eqFilterType": false, "eqSimpleCut": 10, "eqSimplePeak": 0, "envelopeSpeed": 12, "eqSubFilters0": [{ "type": "high-pass", "cutoffHz": 353.55, "linearGain": 0.5 }, { "type": "low-pass", "cutoffHz": 1189.21, "linearGain": 0.5 }, { "type": "high-pass", "cutoffHz": 176.78, "linearGain": 0.0884 }], "effects": ["transition type", "chord type", "granular", "chorus", "echo", "reverb", "plugin"], "transition": "interrupt", "clicklessTransition": false, "chord": "arpeggio", "fastTwoNoteArp": true, "arpeggioSpeed": 8, "granular": 10, "grainSize": 50, "grainFreq": 10, "grainRange": 40, "panDelay": 0, "chorus": 100, "echoSustain": 100, "echoDelayBeats": 2, "reverb": 100, "plugin": [16, 10, 8, 0], "fadeInSeconds": 0, "fadeOutTicks": -1, "unison": "custom", "unisonVoices": 3, "unisonSpread": 12, "unisonOffset": 0, "unisonExpression": 0.03, "unisonSign": 1, "unisonAntiPhased": false, "algorithm": "1\u2190(2\u20023\u20024)", "feedbackType": "1\u27F2", "feedbackAmplitude": 0, "operators": [{ "frequency": "1\xD7", "amplitude": 15, "waveform": "sine", "pulseWidth": 5 }, { "frequency": "1\xD7", "amplitude": 2, "waveform": "sine", "pulseWidth": 5 }, { "frequency": "1\xD7", "amplitude": 0, "waveform": "sine", "pulseWidth": 5 }, { "frequency": "1\xD7", "amplitude": 0, "waveform": "sine", "pulseWidth": 5 }], "envelopes": [{ "target": "noteVolume", "envelope": "twang", "inverse": false, "perEnvelopeSpeed": 5.5, "perEnvelopeLowerBound": 0, "perEnvelopeUpperBound": 1, "discrete": false, "isDrumset": false }, { "target": "noteVolume", "envelope": "punch", "inverse": false, "perEnvelopeSpeed": 1, "perEnvelopeLowerBound": 0, "perEnvelopeUpperBound": 1, "discrete": false, "isDrumset": false }, { "target": "grainSize", "envelope": "none", "inverse": false, "perEnvelopeSpeed": 1, "perEnvelopeLowerBound": 0, "perEnvelopeUpperBound": 2, "discrete": false, "isDrumset": false }, { "target": "echoDelay", "envelope": "none", "inverse": false, "perEnvelopeSpeed": 1, "perEnvelopeLowerBound": 0, "perEnvelopeUpperBound": 2, "discrete": false, "isDrumset": false }, { "target": "none", "envelope": "none", "inverse": false, "perEnvelopeSpeed": 1, "perEnvelopeLowerBound": 0, "perEnvelopeUpperBound": 2, "discrete": false, "isDrumset": false }] }
    }];
    this.effectOrderIndex = 9;
    this.reset = /* @__PURE__ */ __name(() => {
      this.feedback?.reset();
      this.diffuser?.reset();
    }, "reset");
    this.delayLinesInitialized = false;
    this.prevSampleRate = 0;
    //@ts-ignore
    this.initializeDelayLines = /* @__PURE__ */ __name((samplesPerTick, samplesPerSecond) => {
      if (!this.feedback) this.feedback = new MultichannelMixedFeedback(this.channels, this.roomSizeMs, Math.pow(10, -3 * (this.roomSizeMs / 1e3) / this.rt60));
      if (!this.diffuser) this.diffuser = new DiffuserHalfLengths(this.channels, this.diffusionSteps, this.diffusion);
      if (this.prevSampleRate != samplesPerSecond) {
        this.delayLinesInitialized = false;
        this.prevSampleRate = samplesPerSecond;
        this.delayLineLength = 0.1 * this.roomSizeMs * this.prevSampleRate;
      }
      if (this.delayLinesInitialized) return;
      this.feedback.initializeDelayLines(this.prevSampleRate);
      this.diffuser.initializeDelayLines(this.prevSampleRate);
      this.delayLinesInitialized = true;
    }, "initializeDelayLines");
    this.instrumentStateFunction = /* @__PURE__ */ __name((pluginStarts, pluginEnds, samplesPerTick) => {
      this.wet = Math.min(pluginStarts[0] / _ReverbPlusPlugin.wetMax, 1);
      this.roomSizeMs = (pluginStarts[2] + 1) * 25;
      this.brightness = Math.min(pluginStarts[1] / 10, 1);
      this.wetDelta = (pluginEnds[0] - pluginStarts[0]) / samplesPerTick;
      this.brightDelta = (pluginEnds[1] - pluginStarts[1]) / samplesPerTick;
      const diffusion = pluginStarts[3] * 10;
      if (diffusion != this.diffusion) {
        this.diffusion = diffusion;
        this.delayLinesInitialized = false;
      }
      if (this.feedback) this.feedback.dark = this.brightness;
      if (this.diffuser && this.diffusion != 0) this.diffuser.diffusion = this.diffusion;
      if (this.feedback && this.feedback.delayMs != this.roomSizeMs) {
        this.feedback.delayMs = this.roomSizeMs;
        this.feedback.decayGain = Math.pow(10, -3 * (this.roomSizeMs / 1e3) / this.rt60);
        this.delayLinesInitialized = false;
      }
    }, "instrumentStateFunction");
    this.inputDuplicated = new Float32Array(this.channels);
    //@ts-ignore
    this.synthFunction = /* @__PURE__ */ __name((samples, runLength) => {
      if (!this.diffuser || !this.feedback || typeof samples == "number") return samples;
      const [sampleL, sampleR] = samples;
      this.inputDuplicated[0] = sampleL;
      this.inputDuplicated[1] = sampleR;
      this.inputDuplicated[2] = (sampleL + sampleR) * _ReverbPlusPlugin.sqrt2;
      this.inputDuplicated[3] = (sampleL - sampleR) * _ReverbPlusPlugin.sqrt2;
      this.inputDuplicated[4] = -sampleL;
      this.inputDuplicated[5] = -sampleR;
      this.inputDuplicated[6] = -(sampleL + sampleR) * _ReverbPlusPlugin.sqrt2;
      this.inputDuplicated[7] = -(sampleL - sampleR) * _ReverbPlusPlugin.sqrt2;
      const diffuse = this.diffusion ? this.diffuser.process(this.inputDuplicated) : this.inputDuplicated;
      const longLasting = this.feedback.process(diffuse);
      let outputL = longLasting[0] + longLasting[1] + longLasting[2] + longLasting[3] + longLasting[4] + longLasting[5] + longLasting[6] + longLasting[7];
      let outputR = longLasting[4] + longLasting[5] + longLasting[6] + longLasting[7] - longLasting[0] - longLasting[1] - longLasting[2] - longLasting[3];
      outputL /= 2;
      outputR /= 2;
      samples[0] = (1 - this.wet) * sampleL + this.wet * outputL;
      samples[1] = (1 - this.wet) * sampleR + this.wet * outputR;
      this.wet += this.wetDelta;
      this.feedback.dark += this.brightDelta;
      return samples;
    }, "synthFunction");
  }
  static {
    __name(this, "ReverbPlusPlugin");
  }
  static {
    this.wetMax = 16;
  }
  static {
    this.sqrt2 = 1 / Math.sqrt(2);
  }
};
export {
  ReverbPlusPlugin as default
};
