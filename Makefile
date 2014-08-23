# Assuming this Makefile lives in project root directory
PROJECT := $(shell readlink $(dir $(lastword $(MAKEFILE_LIST))) -f)

PROJ_ROOT = $(PROJECT)

include $(PROJECT)/defns.mk

NEED_MKDIR = $(THIRD_PARTY_SRC) \
             $(THIRD_PARTY_LIB) \
             $(THIRD_PARTY_INCLUDE)

all: path \
     third_party_core

path: $(NEED_MKDIR)

$(NEED_MKDIR):
	mkdir -p $@

distclean:
	rm -rf $(filter-out $(THIRD_PARTY)/third_party.mk, \
		            $(wildcard $(THIRD_PARTY)/*))

.PHONY: all path distclean

include $(THIRD_PARTY)/third_party.mk