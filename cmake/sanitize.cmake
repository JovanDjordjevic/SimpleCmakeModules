# SCM_ prefix is used to mark variables that come from SimpleCmakeModules

# At the time of writing this, g++13 and clang++17 were used for testing

# It is up to the user to make sure that the sanitizer they want to use
# is available on the compiler version and OS they use 

# =======================================================================================================================================
# ========================================================== Address Sanitizer ==========================================================
# =======================================================================================================================================

# Add address sanitizer to target (and do not set any other compiler options)
function(add_address_sanitizer SCM_TARGET_NAME)
    message(STATUS "Adding Address Sanitizer to target ${SCM_TARGET_NAME}")

    set(SCM_ASAN_OPTIONS 
        -g
        -fsanitize=address
    )

    target_compile_options(${SCM_TARGET_NAME} PUBLIC ${SCM_ASAN_OPTIONS})
    target_link_libraries(${SCM_TARGET_NAME} PUBLIC ${SCM_ASAN_OPTIONS})
endfunction()

# same as add_address_sanitizer, but also adds useful compiler options for easier debugging with asan
function(add_address_sanitizer_with_options SCM_TARGET_NAME)
    add_address_sanitizer(${SCM_TARGET_NAME})

    message(STATUS "Adding additional options for use with Address Sanitizer")

    set(SCM_ASAN_ADDITIONAL_FLAGS
        -fno-omit-frame-pointer
        -fno-optimize-sibling-calls 
        -fno-common 
        -fsanitize-address-use-after-scope 
        -fno-sanitize-recover
    )

    target_compile_options(${SCM_TARGET_NAME} PUBLIC ${SCM_ASAN_ADDITIONAL_FLAGS})
    target_link_options(${SCM_TARGET_NAME} PUBLIC ${SCM_ASAN_ADDITIONAL_FLAGS})
endfunction()

# =======================================================================================================================================
# ==================================================== Undefined Behavior Sanitizer =====================================================
# =======================================================================================================================================

# Add undefined behavior sanitizer to target (and do not set any other compiler options)
function(add_undefined_behavior_sanitizer SCM_TARGET_NAME)
    message(STATUS "Adding Undefined Behavior Sanitizer to target ${SCM_TARGET_NAME}")

    set(SCM_UBSAN_OPTIONS 
        -g
        -fsanitize=undefined
    )

    target_compile_options(${SCM_TARGET_NAME} PUBLIC ${SCM_UBSAN_OPTIONS})
    target_link_libraries(${SCM_TARGET_NAME} PUBLIC ${SCM_UBSAN_OPTIONS})
endfunction()

# same as add_undefined_behavior_sanitizer, but also adds useful compiler options for easier debugging with ubsan
function(add_undefined_behavior_sanitizer_with_options SCM_TARGET_NAME)
    add_undefined_behavior_sanitizer(${SCM_TARGET_NAME})

    message(STATUS "Adding additional options for use with Undefined Behavior Sanitizer")

    set(SCM_UBSAN_ADDITIONAL_FLAGS
        -fno-omit-frame-pointer
        -fno-optimize-sibling-calls 
        -fno-common 
        -fno-sanitize-recover
        -fno-inline
    )

    target_compile_options(${SCM_TARGET_NAME} PUBLIC ${SCM_UBSAN_ADDITIONAL_FLAGS})
    target_link_options(${SCM_TARGET_NAME} PUBLIC ${SCM_UBSAN_ADDITIONAL_FLAGS})
endfunction()

# =======================================================================================================================================
# ========================================================== Thread Sanitizer ===========================================================
# =======================================================================================================================================

# Add thread sanitizer to target (and do not set any other compiler options)
function(add_thread_sanitizer SCM_TARGET_NAME)
    message(STATUS "Adding Thread Behavior Sanitizer to target ${SCM_TARGET_NAME}")

    set(SCM_TSAN_OPTIONS 
        -g
        -fsanitize=thread
    )

    target_compile_options(${SCM_TARGET_NAME} PUBLIC ${SCM_TSAN_OPTIONS})
    target_link_libraries(${SCM_TARGET_NAME} PUBLIC ${SCM_TSAN_OPTIONS})
endfunction()

# same as add_thread_sanitizer, but also adds useful compiler options for easier debugging with tsan
function(add_thread_sanitizer_with_options SCM_TARGET_NAME)
    add_thread_sanitizer(${SCM_TARGET_NAME})

    message(STATUS "Adding additional options for use with Thread Sanitizer")

    set(SCM_TSAN_ADDITIONAL_FLAGS
        -fno-omit-frame-pointer
        -fno-optimize-sibling-calls 
        -fno-common 
        -fno-sanitize-recover
        -fno-inline
    )

    target_compile_options(${SCM_TARGET_NAME} PUBLIC ${SCM_TSAN_ADDITIONAL_FLAGS})
    target_link_options(${SCM_TARGET_NAME} PUBLIC ${SCM_TSAN_ADDITIONAL_FLAGS})
endfunction()

# =======================================================================================================================================
# ========================================================== Memory Sanitizer ===========================================================
# =======================================================================================================================================

# Add memory to target (and do not set any other compiler options)
function(add_memory_sanitizer SCM_TARGET_NAME)
    message(STATUS "Adding Memory Behavior Sanitizer to target ${SCM_TARGET_NAME}")

    set(SCM_MSAN_OPTIONS 
        -g
        -fsanitize=memory
    )

    target_compile_options(${SCM_TARGET_NAME} PUBLIC ${SCM_MSAN_OPTIONS})
    target_link_libraries(${SCM_TARGET_NAME} PUBLIC ${SCM_MSAN_OPTIONS})
endfunction()

# same as add_memory_sanitizer, but also adds useful compiler options for easier debugging with msan
function(add_memory_sanitizer_with_options SCM_TARGET_NAME)
    add_memory_sanitizer(${SCM_TARGET_NAME})

    message(STATUS "Adding additional options for use with Memory Sanitizer")

    set(SCM_MSAN_ADDITIONAL_FLAGS
        -fno-sanitize-recover
        -fno-omit-frame-pointer
        -fsanitize-memory-track-origins
        -fsanitize-memory-use-after-dtor
    )

    target_compile_options(${SCM_TARGET_NAME} PUBLIC ${SCM_MSAN_ADDITIONAL_FLAGS})
    target_link_options(${SCM_TARGET_NAME} PUBLIC ${SCM_MSAN_ADDITIONAL_FLAGS})
endfunction()

# =======================================================================================================================================
# =========================================================== Leak Sanitizer ============================================================
# =======================================================================================================================================

# NOTE: leak sanitizer is included in address sanitizer by default

# Add leak to target (and do not set any other compiler options)
function(add_leak_sanitizer SCM_TARGET_NAME)
    message(STATUS "Adding Leak Behavior Sanitizer to target ${SCM_TARGET_NAME}")

    set(SCM_LSAN_OPTIONS 
        -g
        -fsanitize=leak
    )

    target_compile_options(${SCM_TARGET_NAME} PUBLIC ${SCM_LSAN_OPTIONS})
    target_link_libraries(${SCM_TARGET_NAME} PUBLIC ${SCM_LSAN_OPTIONS})
endfunction()

# same as add_leak_sanitizer, but also adds useful compiler options for easier debugging with lsan
function(add_leak_sanitizer_with_options SCM_TARGET_NAME)
    add_leak_sanitizer(${SCM_TARGET_NAME})

    message(STATUS "Adding additional options for use with Leak Sanitizer")

    set(SCM_LSAN_ADDITIONAL_FLAGS
        -fno-sanitize-recover
        -fno-omit-frame-pointer
    )

    target_compile_options(${SCM_TARGET_NAME} PUBLIC ${SCM_LSAN_ADDITIONAL_FLAGS})
    target_link_options(${SCM_TARGET_NAME} PUBLIC ${SCM_LSAN_ADDITIONAL_FLAGS})
endfunction()
