CURRENT_PATH := $(dir $(lastword $(MAKEFILE_LIST)))
BINARY_PATH  := $(CURRENT_PATH)bin
SOURCE_PATH  := $(CURRENT_PATH)src

EXE_NAME := whetstone
SOURCES := whetstone.c

OPT_LEVELS := O0 O1 O2 O3 Os

CC=gcc
CFLAGS=-Wall

.PHONY = help
help:
	@echo 'ARQ excersise 1'
	@echo '---------------'
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@echo 'help:'
	@echo '	show this help'
	@echo ''
	@echo 'RUNNING SIMULATIONS'
	@echo '---------------'
	@echo 'ex1:'
	@echo '	Run commands for excersise 1'
	@echo '	Times all executions and outputs in ./results/whetstone-Olevel-[static-]loops'
	@echo ''
	@echo 'BUILDING COMMANDS'
	@echo '---------------'
	@echo 'build_all:'
	@echo '	build all binaries'
	@echo ''
	@echo 'build_dynamic:'
	@echo '	build only dynamic binaries'
	@echo ''
	@echo 'build_static:'
	@echo '	build only static binaries'
	@echo ''

###############
# SIMULATE
###############
ex1: 
	$(CURRENT_PATH)scripts/time_all.sh
	


###############
# BUILD
###############

.PHONY = build_all clean_build
build_all: build_dynamic build_static

clean_build: ## Delete binaries
	rm $(BINARY_PATH)/*

build_dynamic: ## Build dynamic versions
	$(foreach opt, $(OPT_LEVELS), $(CC) $(SOURCE_PATH)/$(SOURCES) $(CFLAGS) -$(opt) -o $(BINARY_PATH)/$(EXE_NAME)-$(opt);)

build_static: ## Build static versions
	$(foreach opt, $(OPT_LEVELS), $(CC) $(SOURCE_PATH)/$(SOURCES) $(CFLAGS) -$(opt) -s -o $(BINARY_PATH)/$(EXE_NAME)-$(opt)-static;)

