#Absolute path of current Makefile
SRCPATH := $(abspath $(lastword $(MAKEFILE_LIST)))

#Absolute path of output directory
OUTPATH := $(abspath $(SRCPATH)/../bin)

#Name of executable
baseexe := whetstone

#Optimization lseexe := benchmark
levels  := 0 1 2 3 s

BIN_DYNAMIC := $(foreach level,$(levels),$(baseexe)-O$(level))
BIN_STATIC  := $(foreach level,$(levels),$(baseexe)-O$(level)-static)


CC=gcc
CFLAGS=-Wall
OUTNAME=whetstone
OPTFLAGS=O0 O1 O2 O3 Os

$(files): $(baseexe).c
    gcc $(subst $(baseexe),,$@) $< -o $@

#dynamic:
	#$(foreach opt, $(OPTFLAGS), $(CC) $(SOURCES) $(CFLAGS) -$(opt) -o $(OUTDIR)/$(OUTNAME)-$(opt);)

#static:
	#$(foreach opt, $(OPTFLAGS), $(CC) $(SOURCES) $(CFLAGS) -$(opt) -static -o $(OUTDIR)/$(OUTNAME)-$(opt)-static;)

.PHONY: clean
clean:
	rm -rf $(OUTDIR)/*

.PHONY: clean_results
