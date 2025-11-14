CC=clang
LD=wasm-ld

CFLAGS=-target wasm32-wasi -nostdlib -Os -I/clang64/share/wasi-sysroot/include/wasm32-wasip2
LDFLAGS=--no-entry -lc -L/clang64/share/wasi-sysroot/lib/wasm32-wasip2 --export=bpbxplug_entry --export malloc --export free --export-table --export-memory
OBJECTS=build/src/corruption.o build/src/printf.o

build/corruption.wasm: $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^

build/%.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJECTS)

.PHONY: clean

# clang -target wasm32-wasi \
# 	-nostdlib -Wl,--no-entry -O3 -lc \
# 	-I /clang64/share/wasi-sysroot/include/wasm32-wasip2 \
# 	-L /clang64/share/wasi-sysroot/lib/wasm32-wasip2 \
# 	-Wl,--export=bpbxplug_entry -Wl,--export=malloc -Wl,--export=free -Wl,--export-table -Wl,--export-memory \
# 	corruption.c printf.c -o corruption.wasm
# 	# --sysroot /clang64/share/wasi-sysroot \
# 	# -nodefaultlibs -Wl,--no-entry \

# 	# test.c printf.c -o test.wasm