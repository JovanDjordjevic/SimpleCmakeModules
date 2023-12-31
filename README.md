# SimpleCmakeModules

A collection of cmake modules I made for use with C++ development.

Table of contents:

- [SimpleCmakeModules](#simplecmakemodules)
  - [Brutal compiler options](#brutal-compiler-options)
  - [Doxy](#doxy)
  - [Grind](#grind)
  - [Sanitize](#sanitize)
  - [Static Analysis](#static-analysis)

## Brutal compiler options

In file `brutal-compiler-options.cmake`

This is a module for enabling most of the warning/error flags during compilation (a lot of them are not enabled with default `-Wall -Wextra` that is commonly used) for a specified target executable or library. Currently supported compilers:

- **GNU ver >= 9.0** (compile options for different GCC versions can be found [here](https://gcc.gnu.org/onlinedocs/))
- **Clang ver >= 10.0**
- **MSVC ver >= 19.0**

**Note that functions in this module only add to existing flags for your targets. They do not replace the already existing flags!**

To add additional compiler warnings to your target (based on your `CMAKE_CXX_COMPILER_ID`) use the provided function:

`scm_add_brutal_compiler_options(<your_target_name> <property_specifier> [<additional_flags>...])`

Parameters:

- **your_target_name** - Name of your target
- **property_specifier** - Set this to one of: **PUBLIC** / **PRIVATE** / **INTERFACE** to set rules to what other taregts/dependencies these compiler flags will be applied to (behavior is same as in the built in `target_compile_options` function)
                     behavior is the same as in `target_compile_options`
- **[<additional_flags>...]** - An optional list of additional compiler flags you wish to add to your target (for example explicitly
                          disable some warnings that are not relevant to you or that are spammy)

Usage example:

```cmake
# In your CmakeLists.txt

...
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/)   # or whichever folder you will store the `brutal-compiler-options.cmake` file
...

...
include(brutal-compiler-options)
...

...
add_library(yourLib yourLibSources)
scm_add_brutal_compiler_options(yourLib PRIVATE)
...

...
add_executable(yourExe yourExeSources)
scm_add_brutal_compiler_options(yourExe PUBLIC)
...

# This will cause `yourLib` and `yourExe` to be compiled with additional warning options determined by your compiler version
# Additional options for yourLib WILL NOT be propagated to other dependent targets
# Additional options for yourExe WILL be propagated to other dependent targets

# Here is also an example of adding additional flags to suppress some annoying and mostly useless warnings:
...
add_executable(yourExe2 yourExeSources)

set(WARNING_SUPPRESSORS)

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    list(APPEND WARNING_SUPPRESSORS -Wno-unsafe-loop-optimizations)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    list(APPEND WARNING_SUPPRESSORS -Wno-padded -Wno-date-time)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    list(APPEND WARNING_SUPPRESSORS /wd4820 /wd4514 /wd4711 /wd5045)
endif()

scm_add_brutal_compiler_options(yourExe2 PUBLIC ${WARNING_SUPPRESSORS})
...
```

## Doxy

In file `doxy.cmake`

This is a module for creating a `docs` target that will generate doxygen documentation. Requires `doxygen` to be present on the system.

Usage example:

```cmake
# In your CmakeLists.txt

...
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/)   # or which ever folder you will store the `doxy.cmake` file
...

...
include(doxy)
scm_create_docs_target(${CMAKE_SOURCE_DIR}/docs) # or which ever folder the Doxyfile is located in
...

# This will create the `docs` target that can be manually built with:
#     cmake --build . --target docs
# Documentation will be created in the folder specified when calling scm_create_docs_target(...) function
```

## Grind

In file `grind.cmake`

This is a module for creating a custom target `*-grind` that will run callgrind and then kcachegrind for a specific target. Requires `valgrind` and `kcachegrind` to be present on the system.

Usage example:

```cmake
...
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/)   # or which ever folder you will store the `grind.cmake` file
...

...
include(grind)
...

...
add_executable(yourExe yourExeSources)
scm_create_grind_target(yourExe)
...

# This will create the `yourExe-grind` target that can be manually built with:
#     cmake --build . --target yourExe-grind
```

## Sanitize

In file `sanitize.cmake`

This is a module for enabling different sanitizers for your targets. Currently supported sanitizers are:

- **Address snitizer** (ASAN)
- **Undefined behavior sanitizer** (UBSAN)
- **Thread sanitizer** (TSAN)
- **Memory sanitizer** (MSAN)
- **Leak sanitier** (LSAN) (Note that leak sanitizer is already included in address sanitizer)

**Note that some sanitizers are not compatible with eachother!**

The module provides 2 types of functions:

- `add_*_sanitizer(<your_target> <target_property_specifier>)` - Adds the necessary compiler and linker options to enable the specified sanitizer. target_property_specifier can be one of: **PUBLIC** / **PRIVATE** / **INTERFACE** and their behavior is same as in the built in `target_compile_options`/`target_link_options`/`target_link_libraries` functions
- `add_*_sanitizer_with_options(<your_target> <target_property_specifier>)` - Same as the above, but also adds some additional compiler and linker flags that pair well with specified sanitizer

At the time of writing this module, the supported sanitizers were tested with `gcc-13` and `clang-17`. They should work with previous compiler versions as well, but no guarantees are made. It is up to the user to make sure they have a toolchain that supports enabling of the requested sanitizer.

Usage example:

```cmake
...
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/)   # or which ever folder you will store the `sanitize.cmake` file
...

...
include(sanitize)
...

...
add_executable(yourExe yourExeSources)

# Note that these are just the possible functions and their invocations. Generally you will never enable a sanitizer both with and without extra options (you will pick only one of those 2). Also, you will use the appropriate target property specifier for your case
# Also note that since some sanitizers are not compatible with eachother, you will probably not add them all to your executable at the same time 

scm_add_address_sanitizer(yourExe PUBLIC)
scm_add_address_sanitizer_with_options(yourExe PUBLIC)

scm_add_undefined_behavior_sanitizer(yourExe PRIVATE)
scm_add_undefined_behavior_sanitizer_with_options(yourExe PRIVATE)

scm_add_thread_sanitizer( INTERFACE)
scm_add_thread_sanitizer_with_options(yourExe INTERFACE)

scm_add_memory_sanitizer(yourExe PUBLIC)
scm_add_memory_sanitizer_with_options(yourExe PRIVATE)

scm_add_leak_sanitizer(yourExe INTERFACE)
scm_add_leak_sanitizer_with_options(yourExe PUBLIC)
...

# By enabling any of the supported sanitizers, when executing `yourExe`, programs will terminate when a sanitizer detects that something is wrong with the program
```

## Static Analysis

In file `static-analysis.cmake`

This is a module for creating static analysis targets for your existing targets. Static analyzers that come built into the compilers are used, therefore the following compilers and versions are supported:

- **GNU ver >= 10.0**
- **Clang ver >= 10.0**
- **MSVC ver >= 15.7**

The module provides the following function:

- `scm_add_static_analysis_target(<your_target>)`
  
Usage example:

```cmake
# Suppose your project structure looks like this:
# cmake/
#     static-analysis.cmake
# src/
#   lib1.cpp
#   lib1.hpp
# CmakeLists.txt
# main.cpp

# Inside CmakeLists.txt you will have something like:

...
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/)
...

...
add_executable(yourExe main.cpp src/lib.cpp)
target_include_directories(yourExe src)

include(static-analysis)
scm_add_static_analysis_target(yourExe)
...

# This will create the `yourExe-static-analyze` target that can be manually built with:
#     cmake --build . --target yourExe-static-analyze
# This will output all warnings found by static analysis to the terminal
# In this example the following files will be checked with static analysis: main.cpp lib1.cpp lib1.hpp
```
