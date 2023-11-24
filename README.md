# SimpleCmakeModules

A collection of cmake modules I made for use with C++ development. 

Table of contents:

- [SimpleCmakeModules](#simplecmakemodules)
  - [Brutal compiler options](#brutal-compiler-options)
  - [Doxy](#doxy)
  - [Grind](#grind)
  - [Sanitize](#sanitize)

## Brutal compiler options

In file `brutal-compiler-options.cmake`

This is a module for enabling most of the warning/error flags during compilation (a lot of them are not enabled with default `-Wall -Wextra` that is commonly used) for a specified target executable or library. Currently supported compilers:

- **GNU ver >= 9.0** (compile options for different GCC versions can be found [here](https://gcc.gnu.org/onlinedocs/))
- **Clang ver >= 10.0**
- **MSVC ver >= 19.0**

**Note that functions in this module only add to existing flags for your targets. They do not replace the already existing flags!**

To add additional compiler warnings to your target use the provided function:
`add_brutal_compiler_options(<your_target_name> <target_property_specifier>)`

target_property_specifier can be one of: **PUBLIC** / **PRIVATE** / **INTERFACE** and their behavior is same as in the built in `target_compile_options` function

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
add_brutal_compiler_options(yourLib PRIVATE)
...

...
add_executable(yourExe yourExeSources)
add_brutal_compiler_options(yourExe PUBLIC)
...

# This will cause `yourLib` and `yourExe` to be compiled with additional warning options determined by your compiler version
# Additional options for yourLib WILL NOT be propagated to other dependent targets
# Additional options for yourExe WILL be propagated to other dependent targets
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
create_docs_target(${CMAKE_SOURCE_DIR}/docs) # or which ever folder the Doxyfile is located in
...

# This will create the `docs` target that can be manually built with:
#     cmake --build . --target docs
# Documentation will be created in the folder specified when calling create_docs_target(...) function
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
create_grind_target(yourExe)
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

add_address_sanitizer(yourExe PUBLIC)
add_address_sanitizer_with_options(yourExe PUBLIC)

add_undefined_behavior_sanitizer(yourExe PRIVATE)
add_undefined_behavior_sanitizer_with_options(yourExe PRIVATE)

add_thread_sanitizer( INTERFACE)
add_thread_sanitizer_with_options(yourExe INTERFACE)

add_memory_sanitizer(yourExe PUBLIC)
add_memory_sanitizer_with_options(yourExe PRIVATE)

add_leak_sanitizer(yourExe INTERFACE)
add_leak_sanitizer_with_options(yourExe PUBLIC)
...

# By enabling any of the supported sanitizers, when executing `yourExe`, programs will terminate when a sanitizer detects that something is wrong with the program
```
