/*
emscripten command:
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

                                    2 MiB is a good choice for typical use case.
                                    depending on the size of your audio buffers,
                                    if you have any, you may need a larger
                                    amount instead.

each module is required to export the following symbols:
    these symbols are exported by emscripten, and perhaps other compilers:
        memory:                     Exported memory object.
        _initialize:                Called when the module is loaded. It takes
                                    no arguments and returns no values.
        __indirect_function_table: 	A table which is used to resolve function
                                    "pointers" to the actual function.
    
    these are symbols are not part of the plugin api, but are required for the
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
    (usize and ptr are a 32-bit unsigned integers)
        bpbxplug_entry:             Entry point for the module. Takes no
                                    parameters, and returns a pointer to a
                                    bpbxplug_module struct. The host will never
                                    attempt to modify this structure.
*/
#ifndef _bpbxplug_h_
#define _bpbxplug_h_

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>

#define BPBXPLUG_API_VERSION "0.0.1"
#define BPBXPLUG_INVALID_ID UINT32_MAX
#define BPBXPLUG_TAIL_INFINITE UINT32_MAX

typedef uint32_t bpbxplug_id;

typedef enum bpbxplug_param_flag {
    // this parameter will not be modulatable by a mod channel
    BPBXPLUG_PARAM_NO_AUTOMATION = 1,
    
    // this parameter will be treated as an integer, but the underlying type
    // is still a double.
    BPBXPLUG_PARAM_STEPPED		 = 2,
} bpbxplug_param_flag_e;

typedef struct bpbxplug_param_info {
    bpbxplug_id id; // id of the parameter. can be non-contiguous.
    const char *name; // human-readable display name
    void *cookie; // cache address to the parameter value, but not touched by
                  // the host.
    uint32_t flags;
    
    double min_value;
    double max_value;
    double default_value;
    
    // if not NULL, this will display the parameter as a dropdown box instead
    // of a slider.
    // this requires that:
    //  1. the parameter has the BPBXPLUG_PARAM_STEPPED flag
    //  2. max_value >= 0 and min_value >= 0
    //  3. the number of elements in the value list is equal to
    //     floor(max_value - min_value)
    // otherwise, this field will be ignored and the parameter will continue to
    // be displayed as a slider.
    const char **enum_values;
} bpbxplug_param_info_s;

// context that will be passed to the plugin's render function
typedef struct bpbxplug_render {
    uint32_t frame_count;
    
    // assume stereo input/output
    float *input[2];
    float *output[2];
} bpbxplug_render_s;

// context that will be passed to the plugin's tick function
typedef struct bpbxplug_tick {
    double bpm;
    double beat;
    double samples_per_tick;
} bpbxplug_tick_s;

typedef struct bpbxplug_plugin_descriptor bpbxplug_plugin_descriptor_s;

typedef struct bpbxplug_plugin {
    const bpbxplug_plugin_descriptor_s *desc;
    void *userdata;
    
    uint32_t input_channel_count;
    uint32_t output_channel_count;
    
    // initialize the plugin. returns true on success, and false on error.
    bool (*init)(struct bpbxplug_plugin *plugin);
    
    // free memory associated with the plugin
    // (don't free the plugin struct though, the host will do that.)
    void (*destroy)(const struct bpbxplug_plugin *plugin);
    
    // obtain the number of parameters that this plugin contains.
    uint32_t (*param_count)(const struct bpbxplug_plugin *plugin);
    
    // get information for a specific parameter. returns true on success, and
    // false on error.
    bool (*get_param_info)(const struct bpbxplug_plugin *plugin,
                           uint32_t index, bpbxplug_param_info_s *param_info);
    
    // get the value of a parameter from its id. returns true on success, and
    // false on error. cookie is from the parameter's info struct.
    bool (*get_param_value)(const struct bpbxplug_plugin *plugin,
                            bpbxplug_id id, void *cookie, double *value);
    
    // set the value of a parameter from its id. returns true on success, and
    // false on error. cookie is from the parameter's info struct.
    bool (*set_param_value)(const struct bpbxplug_plugin *plugin,
                            bpbxplug_id id, void *cookie, double value);
    
    // activates the plugin. this will always be called before the processing
    // call (tick + render)
    bool (*activate)(const struct bpbxplug_plugin *plugin, double sample_rate,
                     uint32_t min_frames_count, uint32_t max_frames_count);
    
    // deactivate the plugin. processing calls will stop until the next
    // activation.
    bool (*deactivate)(const struct bpbxplug_plugin *plugin);
    
    void (*tick)(const struct bpbxplug_plugin *plugin,
                 const bpbxplug_tick_s *tick_ctx);
    void (*render)(const struct bpbxplug_plugin *plugin,
                   const bpbxplug_render_s *render_ctx);
    
    // get the tail length of the plugin in ticks, or BPBXPLUG_TAIL_INFINITE
    // to denote that the tail has an infinite length. this will be called
    // after the tick function ends.
    //
    // context: the host will put the instrument to sleep when no tones are
    // active. but alone, this causes undesirable effects for effects such as
    // echo, reverb, or anything else that leaves a "tail" after the last
    // non-silent input. this is used so the host knows how long it needs
    // to wait before it can safely put the instrument to sleep.
    uint32_t (*get_tail)(const struct bpbxplug_plugin *plugin);
} bpbxplug_plugin_s;

typedef struct bpbxplug_plugin_descriptor {
    const char *api_version;
    
    const char *id;
    const char *name;
    const char *author;
    
    // create a plugin instance. returns true on success, and false on error.
    // if it does error, the host will call the destroy function of the plugin,
    // if it was assigned to and is not NULL.
    bool (*create)(const bpbxplug_plugin_descriptor_s *desc,
                   bpbxplug_plugin_s *plug);
} bpbxplug_plugin_descriptor_s;

// the module's entry point should return a pointer to this structure
typedef struct bpbxplug_module {
    const char *api_version;
    
    // obtain a plugin descriptor from its index within the module.
    // must return NULL when it reaches past the last plugin.
    const bpbxplug_plugin_descriptor_s* (*get_plugin_descriptor)(uint32_t idx);
} bpbxplug_module_s;

#ifdef __cplusplus
}
#endif

#endif