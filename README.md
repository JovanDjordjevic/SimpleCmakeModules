# SimpleCmakeModules

A collection of cmake modules I made.These include:

- `brutal-compiler-options` - Module for enabling most of the warning/error flags during compilation (a lot of them are not enabled with default `-Wall -Wextra` that is commonly used). Currently supported compilers:
  - **GNU ver >= 9.0** (compile options for different GCC versions can be found [here](https://gcc.gnu.org/onlinedocs/))
  - **Clang ver >= 10.0**
  - **MSVC ver >= 19.0**

  Usage example:

  ```cmake
  # In your CmakeLists.txt

  ...
  set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/)   # or which ever folder you will store the `brutal-compiler-options.cmake``
  ...

  ...
  include(brutal-compiler-options)
  ...

  ...
  add_library(yourLib yourLibSources)
  add_brutal_compiler_options(yourLib)
  ...

  ...
  add_executable(yourExe yourExeSources)
  add_brutal_compiler_options(yourExe)
  ...

  # This will cause `yourLib` and `yourExe` to be compiled with additional warning options determined by your compiler version
  ```
