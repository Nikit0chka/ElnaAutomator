CC=/usr/bin/gcc
CFLAGS=-fPIC -Wno-implicit-function-declaration -Wno-unused-function -I"/mnt/c/Program Files (x86)/elplc-logic/toolchains/amd64/include" -I"/mnt/c/Program Files (x86)/elplc-logic/toolchains/elplc_compiler/windows/lib/C"
LDFLAGS=-shared -lrt -lm -L"/mnt/c/Program Files (x86)/elplc-logic/toolchains/amd64/lib/"
src = config1.c resource1.c plc_main.c plc_variables.c plc_variables_PROGRAM0.c plc_variables_.c elna_1.c opcua_0.c
obj = $(src:.c=.o)
zru.so: $(obj)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)