# SCM_ prefix is used to mark variables that come from SimpleCmakeModules

function(create_grind_target SCM_TARGET_NAME)
    find_program(SCM_VALGRIND_EXECUTABLE valgrind)
    if(NOT SCM_VALGRIND_EXECUTABLE)
        message(FATAL_ERROR "Error: 'valgrind' executable not found. Please install Valgrind.")
    endif()

    find_program(SCM_KCACHEGRIND_EXECUTABLE kcachegrind)
    if(NOT SCM_KCACHEGRIND_EXECUTABLE)
        message(FATAL_ERROR "Error: 'kcachegrind' executable not found. Please install KCacheGrind.")
    endif()
    
    add_custom_target(
        ${SCM_TARGET_NAME}-grind
        COMMAND ${SCM_VALGRIND_EXECUTABLE} --tool=callgrind --callgrind-out-file=${SCM_TARGET_NAME}.callgrind.out $<TARGET_FILE:${SCM_TARGET_NAME}>
        COMMAND ${SCM_KCACHEGRIND_EXECUTABLE} ${SCM_TARGET_NAME}.callgrind.out
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMENT "Opening Callgrind output with KCacheGrind"
    )
endfunction()
