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
  set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/)   # or which ever folder you will store the `brutal-compiler-options.cmake` file
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

- `doxy` - Module for creating a `docs` target that will generate doxygen documentation. Requires `doxygen` to be present on the system.

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
