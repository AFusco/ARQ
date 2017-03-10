CURRENT_PATH := $(dir $(lastword $(MAKEFILE_LIST)))
BINARY_PATH  := $(CURRENT_PATH)bin
SOURCE_PATH  := $(CURRENT_PATH)src


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
ex1: ex1time ex1csv

ex1time:
	$(CURRENT_PATH)scripts/time_all.sh

ex1csv: 
	$(CURRENT_PATH)scripts/make_csv1.sh > $(CURRENT_PATH)html/data1.csv

.PHONY: clean_ex1
clean_ex1:
	rm ./results/ex1/*
	


###############
# BUILD
###############
EXE_NAME := whetstone
SOURCES := whetstone.c

OPT_LEVELS := O0 O1 O2 O3 Os

CC=gcc
CFLAGS=-Wall
LDFLAGS=-lm

.PHONY = build_all clean_build
build_all: build_dynamic build_static

clean_build: ## Delete binaries
	rm $(BINARY_PATH)/*

build_dynamic: ## Build dynamic versions
	@echo 'Building dynamic binaries'
	$(foreach opt, $(OPT_LEVELS), $(CC) $(SOURCE_PATH)/$(SOURCES) $(CFLAGS) $(LDFLAGS) -$(opt) -o $(BINARY_PATH)/$(EXE_NAME)-$(opt);)

build_static: ## Build static versions
	@echo 'Building static binaries'
	$(foreach opt, $(OPT_LEVELS), $(CC) $(SOURCE_PATH)/$(SOURCES) $(CFLAGS) $(LDFLAGS) -$(opt) -s -o $(BINARY_PATH)/$(EXE_NAME)-$(opt)-static;)

