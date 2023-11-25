add_executable(main main.cpp second.cpp lib1/lib1.cpp)
target_include_directories(main PRIVATE lib1)

include(static-analysis)
scm_add_static_analysis_target(main)

include(brutal-compiler-options)

set(WARNING_SUPPRESSORS)

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    list(APPEND WARNING_SUPPRESSORS -Wno-unsafe-loop-optimizations)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    list(APPEND WARNING_SUPPRESSORS -Wno-padded -Wno-date-time)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    list(APPEND WARNING_SUPPRESSORS /wd4820 /wd4514 /wd4711 /wd5045)
endif()

scm_add_brutal_compiler_options(main PUBLIC ${WARNING_SUPPRESSORS})

include(doxy)
scm_create_docs_target(${CMAKE_SOURCE_DIR}/docs)

include(grind)
scm_create_grind_target(main)

include(sanitize)
scm_add_address_sanitizer_with_options(main PRIVATE)
scm_add_undefined_behavior_sanitizer_with_options(main PRIVATE)
# scm_add_thread_sanitizer_with_options(main PRIVATE)
# scm_add_memory_sanitizer_with_options(main PRIVATE)
# scm_add_leak_sanitizer_with_options(main PRIVATE)
