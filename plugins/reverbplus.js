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

// pluginSource/ReverbPlus.ts
var import_beepboxplugin = __toESM(require_dist());
var epsilon = 1e-20;
function sanitize(sample) {
  if (Number.isFinite(sample) && Math.abs(sample) >= epsilon) return sample;
  return 0;
}
__name(sanitize, "sanitize");
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
    this.delayIndices = [];
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
      if ((!this.delays[i] || this.delaySamples[i] > this.delays[i].length) && this.delaySamples[i] > 0) {
        this.delays[i] = new Float32Array(this.delaySamples[i]);
        this.delayIndices[i] = 0;
      }
      this.mixed[i] = 0;
    }
  }
  reset() {
    for (let i = 0; i < this.channels; i++) {
      for (let j = 0; j < this.delaySamples[i]; j++) this.delays[i][j] = 0;
      this.delayIndices[i] = 0;
      this.delayed[i] = 0;
      this.mixed[i] = 0;
    }
  }
  process(input) {
    for (let i = 0; i < this.channels; i++) {
      let delayIndex = this.delayIndices[i] + 1;
      if (delayIndex >= this.delaySamples[i]) delayIndex -= this.delaySamples[i];
      this.delayed[i] = this.delays[i][delayIndex];
      this.mixed[i] += this.dark * (this.delayed[i] - this.mixed[i]);
      ;
    }
    houseHolder(this.mixed);
    for (let i = 0; i < this.channels; i++) {
      let delayIndex = this.delayIndices[i] + 1;
      if (delayIndex >= this.delaySamples[i]) delayIndex -= this.delaySamples[i];
      this.delays[i][this.delayIndices[i]] = sanitize(input[i] + this.mixed[i] * this.decayGain);
      this.delayIndices[i] = delayIndex;
    }
    return this.delayed;
  }
};
var DiffusionStep = class {
  constructor(channels) {
    this.channels = channels;
    this.delaySamples = [];
    this.delayIndices = [];
    this.delays = [];
    this.flips = [];
    this.delayMsRange = 50;
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
      if ((!this.delays[i] || this.delaySamples[i] > this.delays[i].length) && this.delaySamples[i] > 0) {
        this.delays[i] = new Float32Array(this.delaySamples[i]);
        this.delayIndices[i] = 0;
      }
    }
  }
  reset() {
    for (let i = 0; i < this.channels; i++) {
      for (let j = 0; j < this.delaySamples[i]; j++) this.delays[i][j] = 0;
      this.delayIndices[i] = 0;
      this.flips[i] = Math.round(Math.random()) == 1;
      this.delayed[i] = 0;
    }
  }
  process(input) {
    for (let i = 0; i < this.channels; i++) {
      if (!this.delays[i]) return input;
      let delayIndex = this.delayIndices[i] + 1;
      if (delayIndex >= this.delaySamples[i]) delayIndex -= this.delaySamples[i];
      this.delayed[i] = this.delays[i][delayIndex] || 0;
      this.delays[i][this.delayIndices[i]] = sanitize(input[i]);
      this.delayIndices[i] = delayIndex;
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
var pluginName = "reverb+";
var ReverbPlusPlugin = class _ReverbPlusPlugin extends import_beepboxplugin.BeepBoxEffectPlugin {
  constructor() {
    super(...arguments);
    this.pluginName = pluginName;
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
