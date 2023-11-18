# SCM_ prefix is used to mark variables that come from SimpleCmakeModules

function(create_docs_target SCM_FOLDER_WITH_DOXYFILE)
    find_package(Doxygen)

    if(DOXYGEN_FOUND)
        message(STATUS "Creating `docs` target for generating doxygen documentation")

        add_custom_target(
            docs
            ${DOXYGEN_EXECUTABLE}
            WORKING_DIRECTORY ${SCM_FOLDER_WITH_DOXYFILE}
        )
    else()
        message(STATUS "Could not find doxygen executable. Cannot create `docs` target")
    endif()
endfunction()
