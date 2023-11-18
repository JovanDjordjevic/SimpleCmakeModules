# SimpleCmakeModules

A collection of cmake modules I made.These include:

- `brutal-compiler-options` - Module for enabling most of the warning/error flags during compilation (a lot of them are not enabled with default `-Wall -Wextra` that is commonly used). Currently supported compilers:
  - GNU ver >= 9.0

  Usage example:

  ```cmake
  # In your CmakeLists.txt

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
