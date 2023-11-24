# SCM_ prefix is used to mark variables that come from SimpleCmakeModules

# At the time of writing this, g++13, clang++17 and msvc 19.37 were used for testing

function(add_static_analysis_target SCM_TARGET_NAME SCM_SOURCE_ROOT_DIR)
    message(STATUS "Detected ${CMAKE_CXX_COMPILER_ID} compiler, version: ${CMAKE_CXX_COMPILER_VERSION}")

    set(SCM_ANALYZER_OPTIONS)

    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "10.0.0")
            message(FATAL_ERROR "Error: GNU compiler does not support static analysis as compiler option untill version 10.0.0")
        endif()

        list(APPEND SCM_ANALYZER_OPTIONS -fanalyzer)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
        if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "10.0.0")
            message(FATAL_ERROR "Error: MSVC compiler does not support static analysis as compiler option untill version 10.0.0")
        endif()

        list(APPEND SCM_ANALYZER_OPTIONS --analyze)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS "15.7.0")
            message(FATAL_ERROR "Error: MSVC compiler does not support static analysis as compiler option untill version 15.7.0")
        endif()

        list(APPEND SCM_ANALYZER_OPTIONS /analyze)
    else()
        message(FATAL_ERROR "Compiler: Unknown or unsupported compiler")
    endif()
  
    get_target_property(SCM_TARGET_SOURCES ${SCM_TARGET_NAME} SOURCES)
    set(SCM_TARGET_SOURCES_ABSOLUTE_PATHS)

    foreach(SCM_SINGLE_TARGET_SOURCE ${SCM_TARGET_SOURCES})
        cmake_path(APPEND SCM_SOURCE_ABS_PATH ${SCM_SOURCE_ROOT_DIR} ${SCM_SINGLE_TARGET_SOURCE})
        list(APPEND SCM_TARGET_SOURCES_ABSOLUTE_PATHS ${SCM_SOURCE_ABS_PATH})
    endforeach()

    message(STATUS "Creating ${SCM_TARGET_NAME}-static-analyze target")

    add_custom_target(
        ${SCM_TARGET_NAME}-static-analyze
        COMMAND ${CMAKE_CXX_COMPILER} ${SCM_ANALYZER_OPTIONS} ${SCM_TARGET_SOURCES_ABSOLUTE_PATHS}
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    )
endfunction()
