add_executable(main main.cpp second.cpp lib1/lib1.cpp)
target_include_directories(main PRIVATE lib1)

include(static-analysis)
add_static_analysis_target(main ${CMAKE_CURRENT_SOURCE_DIR})

include(brutal-compiler-options)
add_brutal_compiler_options(main PUBLIC)

include(doxy)
create_docs_target(${CMAKE_SOURCE_DIR}/docs)

include(grind)
create_grind_target(main)

include(sanitize)
add_address_sanitizer_with_options(main PRIVATE)
add_undefined_behavior_sanitizer_with_options(main PRIVATE)
# add_thread_sanitizer_with_options(main PRIVATE)
# add_memory_sanitizer_with_options(main PRIVATE)
# add_leak_sanitizer_with_options(main PRIVATE)
