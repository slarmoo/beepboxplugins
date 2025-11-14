/*
emscripten compilation command:
    emcc plugin.c --no-entry -sSTANDALONE_WASM -sEXPORTED_FUNCTIONS=_bpbxplug_entry,_malloc,_free

and suggested flags:
    -sMALLOC=emmalloc               typical memory allocation usage should be
                                    low, so emscripten recommends using this.
    -sINITIAL_HEAP=...              emscripten's default is 16 MiB of memory,
                                    which for typical use case is probably a bit
                                    too much. here are some values you can
                                    set this to:

                                    524288  = 0.5 MiB
                                    1048576 = 1 MiB
                                    2097152 = 2 MiB
                                    4194304 = 4 MiB
                                    8388608 = 8 MiB

                                    1 MiB is a good choice for typical use case.
                                    If you have a delay line or store some other
                                    sort of internal audio buffer, you may want
                                    to use a larger value.

each module is required to export the following symbols:
    compiler exports:
        memory:                     Exported memory object.
        __indirect_function_table: 	A table which is used to resolve function
                                    "pointers" to the actual function.
    
    these symbols are not part of the plugin api, but are required for the
    module to export:
        malloc:                     Function to dynamically allocate memory
                                    within the module. Takes one unsigned
                                    32-bit integer as a parameter, which
                                    represents the size of the desired
                                    allocation, and then returns a
                                    pointer to the newly allocated portion
                                    of memory. If this fails, it should return
                                    a null pointer.
        free:                       Frees a previously dynamically allocated
                                    portion of memory. Takes one unsigned
                                    32-bit integer as a parameter, which is the
                                    base pointer of the memory allocation, and
                                    returns no values. If the given parameter is
                                    a null pointer, it should do nothing.
    
    the rest are functions for the plugin api:
        const bpbxplug_module_s* bpbxplug_entry(void)
            Entry point for the module.
*/
#ifndef _bpbxplug_h_
#define _bpbxplug_h_

#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#define BPBXPLUG_API_VERSION "0.0.1"

#define BPBXPLUG_API_IMPORT(name) extern \
    __attribute__((import_module("bpbxplug"), import_name(name)))

//types of plugin ui elements
typedef enum element_type {
    slider,
    checkbox,
    dropdown
} element_type_s;

//a plugin ui element
typedef struct bpbxplug_element {
    //set type to the element type that you are using
    element_type_s type;
    //the display name of the ui element
    char *name;
} bpbxplug_element_s;

//a slider ui element
typedef struct slider {
    bpbxplug_element_s base;
    //the max value for the slider. Must be less than 64
    uint8_t max;
} slider_s;

typedef struct checkbox {
    bpbxplug_element_s base;
} checkbox_s;

typedef struct dropdown {
    bpbxplug_element_s base;
    //the set of options for the dropdown. A list of strings. Must have
    //less than 64 options
    const char **options;
} dropdown_s;

union ui_element {
    bpbxplug_element_s base;
    slider_s slider;
    checkbox_s checkbox;
    dropdown_s dropdown;
};

// context that will be passed to the plugin's render function
typedef struct bpbxplug_render {
    // the length of each audio buffer
    uint32_t run_length;

    // 1 - mono
    // 2 - stereo
    // whether or not it is mono or stereo depends solely on if the effect is
    // configured to run before or after panning
    uint8_t channel_count;
    
    // input/output buffer (processing is done in-place)
    // if this effect is specified to run before panning, samples[0] will
    // contain the mono audio buffer, and samples[1] will be NULL.
    // if this effect is ran after panning, samples[0] will conatin the left
    // audio buffer and samples[1] will contain the right audio buffer.

    // question: should this be a Float32Array (float*) or a Float64Array (double*)?
    // Numbers in javascript use doubles.
    double *samples[2];
} bpbxplug_render_s;

// context that will be passed to the plugin's tick function
typedef struct bpbxplug_tick {
    double samples_per_tick;
} bpbxplug_tick_s;

// the main plugin object
typedef struct bpbxplug_plugin {
    // points to internal data used by the host. Do not touch!
    const void *const host_data;

    // can be used by the code to store intermediate values. the host will not
    // touch this.
    void *userdata;

    // parameter data managed and provided to by the host
    const uint32_t param_count;
    const double *const params;

    // delay line managed and provided to by the host.
    // delay_line may be NULL
    const uint32_t delay_line_size;
    float *const delay_line;

    // the sample rate of the audio stream.
    // is always 48khz anyway, but is nice to know.
    const double samples_per_second;

    // tail length of the effect in ticks. by default, this is equal to the
    // duration of the delay buffer. it is not const, so the plugin can modify
    // this.
    int32_t tail_length;
} bpbxplug_plugin_s;

// a pointer this struct must be returned by bpbxplug_entry
typedef struct bpbxplug_module {
    // this must be set to BPBXPLUG_API_VERSION
    const char *api_version;

    //plugin name
    const char *plugin_name;

    //how many ui elements there are
    uint8_t uiElementCount;

    //plugin ui elements. Must be less than 64
    union ui_element *uiElements;

    //how many parameters there are
    uint8_t paramCount;

    // initialize a newly created plugin instance. the plugin structure is
    // allocated by the host.
    bool (*init)(bpbxplug_plugin_s *plugin);

    // free memory associated with a plugin instance, but not the plugin
    // instance itself, as that is done by the host.
    void (*destroy)(const bpbxplug_plugin_s *plugin);

    // called on every tick before audio is rendered. parameters should be
    // read here and set up to be read/interpolated in the render function.
    void (*tick)(const struct bpbxplug_plugin *plugin,
                 const bpbxplug_tick_s *tick_ctx);

    // render effect audio
    void (*render)(const struct bpbxplug_plugin *plugin,
                   const bpbxplug_render_s *render_ctx);
} bpbxplug_module_s;



// wrapper for JavaScript console.log
BPBXPLUG_API_IMPORT("log")
void bpbxplug_log(char *msg);

#endif