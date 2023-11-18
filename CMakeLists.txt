cmake_minimum_required(VERSION 3.16)

project(test VERSION 1.0.0 LANGUAGES CXX)

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
    message(FATAL_ERROR "In-source builds not allowed. Please make a build directory.")
endif()

if(NOT CMAKE_BUILD_TYPE)
    message(STATUS "No build type selected, default to Debug")
    set(CMAKE_BUILD_TYPE "Debug")
endif()

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)   # NOTE: does nothing if generator is set to Visual Studio
set(CMAKE_CXX_OUTPUT_EXTENSION_REPLACE ON)

include(brutal-compiler-options)

add_executable(main main.cpp)
add_brutal_compiler_options(main)

include(doxy)
create_docs_target(${CMAKE_SOURCE_DIR}/docs)

include(grind)
create_grind_target(main)
