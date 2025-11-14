#include "bpbxplug.h"

#define _USE_MATH_DEFINES
#include <stddef.h>
#include <stdarg.h>
#include <stdlib.h>
#include <math.h>

// not using stdio.h to prevent the risk of importing wasi syscalls.
// well, it doesn't with emcc, but i tested it with raw clang and wasi-libc and
// it annoyingly does.
#include "printf.h"

// what? WHY ARE THESE HERE
#undef max
#undef min

static inline double max(double a, double b) { return a > b ? a : b; }
static inline double min(double a, double b) { return a < b ? a : b; }
static inline double maxi(int a, int b) { return a > b ? a : b; }

// logs formatted message
static void bpbxplug_logf(const char *fmt, ...) {
	// C's version of "string interpolation"
	static char buf[128];
	va_list va;
	va_start(va, fmt);
	vsnprintf(buf, 128, fmt, va);
	va_end(va);

	bpbxplug_log(buf);
}

// intermediate values
typedef struct PluginData {
	double corruptionAmount;
	int corruptionType;
	double corruptionTime;
} PluginData;

static bool pluginInit(bpbxplug_plugin_s *plugin) {
	// allocate memory needed for new PluginData instance
	PluginData *plugData = malloc(sizeof(PluginData));

	// if instance could not be created (i.e. out of memory),
	// return error status.
	if (plugData == NULL)
		return false;

	// contents start out undefined (meaning essentially random values)
	// zero-initialize contents of PluginData
	*plugData = (PluginData){0};

	plugin->userdata = plugData;

	// log contents of struct for debugging purposes
	bpbxplug_logf("init called!");
	// bpbxplug_logf("param count: %i", plugin->param_count);
	// for (uint32_t i = 0; i < plugin->param_count; ++i) {
	// 	bpbxplug_logf("\tparam[%i] = %f", i, plugin->params[i]);
	// }
	// bpbxplug_logf("sample rate: %.1f", plugin->samples_per_second);
	return true;
}

static void pluginDestroy(const bpbxplug_plugin_s *plugin) {
	bpbxplug_logf("destroy plugin");

	// fetch and delete PluginData instance
	PluginData *plugData = plugin->userdata;
	free(plugData);
}

static void pluginTick(const bpbxplug_plugin_s *plugin,
					   const bpbxplug_tick_s *tick_ctx)
{
	PluginData *plugData = plugin->userdata;
	// bpbxplug_logf("pluginTick: plugin->params[0]=%f", plugin->params[0]);
	plugData->corruptionAmount = plugin->params[0];
	plugData->corruptionType = (int)plugin->params[1];
	plugData->corruptionTime = plugin->params[2] + 1.0;
	// bpbxplug_logf("pluginTick: after copy plugData->corruptionAmount=%f", plugData->corruptionAmount);
}

static void pluginRender(const bpbxplug_plugin_s *plugin,
						 const bpbxplug_render_s *render_ctx)
{
	PluginData *plugData = plugin->userdata;

	double corruptionAmount = plugData->corruptionAmount;
	int corruptionType = plugData->corruptionType;
	double corruptionTime = plugData->corruptionTime;
	// bpbxplug_logf("pluginRender: plugData->corruptionAmount=%f, corruptionType=%d", corruptionAmount, corruptionType);

	double *const samples = render_ctx->samples[0];
	double const sampleOld = samples[0];
	for (uint32_t i = 0; i < render_ctx->run_length; ++i) {
		double sample = samples[i];

		const int isCorr0 = maxi(-1 * abs(corruptionType - 0)+1, 0);
		const int isCorr1 = maxi(-1 * abs(corruptionType - 1)+1, 0);
		const int isCorr2 = maxi(-1 * abs(corruptionType - 2)+1, 0);
		const int isCorr3 = maxi(-1 * abs(corruptionType - 3)+1, 0);
		
		const double corr0helper0 = max(-1 * fabs(corruptionAmount - 0)+1,0);
		const double corr0helperInbetween = min(max(-1 * fabs(corruptionAmount - 32.0/2)+32.0/2, 0), 1);
		const double corr0helperMax = max(-1 * fabs(corruptionAmount - 32)+1, 0);
		const double corr0helperFunction = 2 * floor(fmod((corruptionAmount * corruptionTime / 32), 2))-1;

		const double corr0 = corr0helper0 + corr0helperMax * -1 + corr0helperInbetween * corr0helperFunction;
		const double corr1 = (2 / M_PI) * asin(cos(corruptionAmount * corruptionTime / 32));
		const double corr2 = fmod((corruptionAmount * corruptionTime / 32 - 1), 2) * - 1;
		const double corr3 = -1 * min(max(tan(corruptionAmount * corruptionTime / 32 + 90),-1),1);
		sample = isCorr0*corr0*sample + isCorr1*corr1*sample + isCorr2*corr2*sample + isCorr3*corr3*sample;
		corruptionTime += 1.0;
		samples[i] = sample;
	}
	// bpbxplug_logf("%d, %d", sampleOld, samples[0]);
	bpbxplug_logf("%d, %d", corruptionTime, render_ctx->run_length);

	plugData->corruptionTime = corruptionTime;
}

const slider_s slider1 = {
	.base = { .type = slider, .name = "Corruption" },
    .max = 32
};

static const char *corruptionTypes[] = {
    "Invert chunks",
    "Asin",
    "Engine",
    "Buzz"
};

const dropdown_s dropdown1 = {
	.base = { .type = dropdown, .name = "Corrupt type" },
    .options = corruptionTypes
};

static union ui_element uiElements[] = {
	{.slider = slider1},
	{.dropdown = dropdown1},
};

static const bpbxplug_module_s module = (bpbxplug_module_s){
	.api_version = BPBXPLUG_API_VERSION,
	.plugin_name = "Corruption",
	.uiElementCount = sizeof(uiElements) / sizeof(uiElements[0]),
	.uiElements = uiElements,
	.paramCount = 2,
	.init = pluginInit,
	.destroy = pluginDestroy,
	.tick = pluginTick,
	.render = pluginRender};

const bpbxplug_module_s* bpbxplug_entry(void) {
	bpbxplug_log("bpbxplug_entry called");
	return &module;
}