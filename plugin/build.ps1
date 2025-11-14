emcc src/corruption.c src/printf.c --no-entry -sSTANDALONE_WASM -O2 -o build/corruption.wasm `
	-sEXPORTED_FUNCTIONS="_bpbxplug_entry,_malloc,_free" `
	-sMALLOC=emmalloc `
	-sINITIAL_HEAP=1048576