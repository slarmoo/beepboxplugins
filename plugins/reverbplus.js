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

// pluginSource/ReverbPlus.ts
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
  initializeDelayLines(sampleRate2) {
    const delayBase = this.delayMs * 1e-3 * sampleRate2;
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
      if (delayIndex > this.delaySamples[i]) delayIndex -= this.delaySamples[i];
      this.delays[i][this.delayIndices[i]] = input[i] + this.mixed[i] * this.decayGain || 0;
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
  initializeDelayLines(sampleRate2, delayMsRange = 50) {
    if (this.delayMsRange != delayMsRange) {
      const delaySamplesRange = this.delayMsRange * 1e-3 * sampleRate2;
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
      this.delays[i][this.delayIndices[i]] = input[i];
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
  initializeDelayLines(sampleRate2) {
    let delayMS = this.diffusion;
    for (let i = 0; i < this.stepCount; i++) {
      if (!this.diffusionSteps[i]) this.diffusionSteps[i] = new DiffusionStep(this.channels);
      this.diffusionSteps[i].initializeDelayLines(sampleRate2, delayMS);
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
var ReverbPlusPlugin = class _ReverbPlusPlugin extends EffectPlugin {
  constructor() {
    super();
    this.pluginName = pluginName;
    this.about = "A better implementation of reverb based on the ADC talk found here: https://youtu.be/6ZK2Goiyotk?si=HpSDjgY5dtoMC-y6";
    this.channels = 8;
    this.diffusionSteps = 4;
    this.roomSizeMs = 150;
    this.rt60 = 10;
    this.wet = 1;
    this.brightness = 0.2;
    this.diffusion = 50;
    this.feedback = null;
    this.diffuser = null;
    this.elements = [
      {
        type: "slider",
        initialValue: _ReverbPlusPlugin.wetMax,
        max: _ReverbPlusPlugin.wetMax,
        name: "Reverb+"
      },
      {
        type: "slider",
        initialValue: 2,
        max: 10,
        name: "brightness"
      },
      {
        type: "slider",
        initialValue: 5,
        max: 8,
        name: "Room Size"
      },
      {
        type: "slider",
        initialValue: 4,
        max: 8,
        name: "Diffusion"
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
    this.initializeDelayLines = /* @__PURE__ */ __name((samplesPerTick) => {
      if (!this.feedback) this.feedback = new MultichannelMixedFeedback(this.channels, this.roomSizeMs, Math.pow(10, -3 * (this.roomSizeMs / 1e3) / this.rt60));
      if (!this.diffuser) this.diffuser = new DiffuserHalfLengths(this.channels, this.diffusionSteps, this.diffusion);
      if (this.prevSampleRate != sampleRate) {
        this.delayLinesInitialized = false;
        this.prevSampleRate = sampleRate;
        this.delayLineLength = 0.1 * this.roomSizeMs * this.prevSampleRate;
      }
      if (this.delayLinesInitialized) return;
      this.feedback.initializeDelayLines(this.prevSampleRate);
      this.diffuser.initializeDelayLines(this.prevSampleRate);
      this.delayLinesInitialized = true;
    }, "initializeDelayLines");
    this.instrumentStateFunction = /* @__PURE__ */ __name((instrument) => {
      this.wet = instrument.pluginValues[0] / _ReverbPlusPlugin.wetMax;
      this.roomSizeMs = (instrument.pluginValues[2] + 1) * 25;
      this.brightness = instrument.pluginValues[1] / 10;
      const diffusion = (instrument.pluginValues[3] + 1) * 10;
      if (diffusion != this.diffusion) {
        this.diffusion = diffusion;
        this.delayLinesInitialized = false;
      }
      if (this.feedback) this.feedback.dark = this.brightness;
      if (this.diffuser) this.diffuser.diffusion = this.diffusion;
      if (this.feedback && this.feedback.delayMs != this.roomSizeMs) {
        this.feedback.delayMs = this.roomSizeMs;
        this.feedback.decayGain = Math.pow(10, -3 * (this.roomSizeMs / 1e3) / this.rt60);
        this.delayLinesInitialized = false;
      }
    }, "instrumentStateFunction");
    this.inputDuplicated = new Float32Array(this.channels);
    //@ts-ignore
    this.synthFunction = /* @__PURE__ */ __name((sampleL, sampleR, runLength) => {
      if (!this.diffuser || !this.feedback) return [sampleL, sampleR];
      for (let i = 0; i < this.channels; i += 2) {
        this.inputDuplicated[i] = sampleL;
        this.inputDuplicated[i + 1] = sampleR;
        this.inputDuplicated[i + 2] = (sampleL + sampleR) / 2;
        this.inputDuplicated[i + 3] = (sampleL - sampleR) / 2;
      }
      const diffuse = this.diffuser.process(this.inputDuplicated);
      const longLasting = this.feedback.process(diffuse);
      for (let i = 0; i < this.channels; i++) {
        this.inputDuplicated[i] = (1 - this.wet) * this.inputDuplicated[i] + this.wet * longLasting[i] * 2;
      }
      let outputL = 0;
      let outputR = 0;
      for (let i = 0; i < this.channels; i += 4) {
        outputL += this.inputDuplicated[i];
        outputR += this.inputDuplicated[i + 1];
        outputL += this.inputDuplicated[i + 2];
        outputR += this.inputDuplicated[i + 3];
      }
      outputL /= 2;
      outputR /= 2;
      return [outputL, outputR];
    }, "synthFunction");
  }
  static {
    __name(this, "ReverbPlusPlugin");
  }
  static {
    this.wetMax = 16;
  }
};
globalThis[pluginName] = ReverbPlusPlugin;
export {
  ReverbPlusPlugin as default
};
