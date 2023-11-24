add_executable(main main.cpp second.cpp lib1/lib1.cpp)
target_include_directories(main PRIVATE lib1)

include(static-analysis)
scm_add_static_analysis_target(main ${CMAKE_CURRENT_SOURCE_DIR})

include(brutal-compiler-options)
scm_add_brutal_compiler_options(main PUBLIC)

# include(doxy)
# scm_create_docs_target(${CMAKE_SOURCE_DIR}/docs)

# include(grind)
# scm_create_grind_target(main)

include(sanitize)
scm_add_address_sanitizer_with_options(main PRIVATE)
scm_add_undefined_behavior_sanitizer_with_options(main PRIVATE)
# scm_add_thread_sanitizer_with_options(main PRIVATE)
# scm_add_memory_sanitizer_with_options(main PRIVATE)
# scm_add_leak_sanitizer_with_options(main PRIVATE)
