DIR := $(subst /,\,$(CURDIR))
BUILD_DIR := bin
OBJ_DIR := obj

ASSEMBLY := tests
EXTENSION := .exe
COMPILER_FLAGS := -g -MD -Werror=vla -Wno-missing-braces -fdeclspec
INCLUDE_FLAGS := -Iengine\src -Itests\src
LINKER_FLAGS := -g -lengine.lib -L$(OBJ_DIR)\engine -L$(BUILD_DIR)
DEFINES := -D_DEBUG -DCIMPORT

rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

SRC_FILES := $(call rwildcard,$(ASSEMBLY)/,*.c)
DIRECTORIES := \$(ASSEMBLY)\src $(subst $(DIR),,$(shell dir $(ASSEMBLY)\src /S /AD /B | findstr /i src))
OBJ_FILES := $(SRC_FILES:%=$(OBJ_DIR)/%.o)

all: scaffold compile link

.PHONY: scaffold
scaffold:
	@echo Scaffolding folder structure
	-@setlocal enableextensions enabledelayedexpansion && mkdir $(addprefix $(OBJ_DIR), $(DIRECTORIES)) 2>NUL || cd .
	@echo Done

.PHONY: link
link: scaffold $(OBJ_FILES)
	@echo Linking $(ASSEMBLY)
	@clang $(OBJ_FILES) -o $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION) $(LINKER_FLAGS)

.PHONY: compile
compile:
	@echo Compiling

.PHONY: clean
clean:
	if exist $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION) del $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION)
	rmdir /s /q $(OBJ_DIR)\$(ASSEMBLY)

$(OBJ_DIR)/%.c.o: %.c
	@echo   $<
	@clang $< $(COMPILER_FLAGS) -c -o $@ $(DEFINES) $(INCLUDE_FLAGS)

-include $(OBJ_FILES:.o=.d)