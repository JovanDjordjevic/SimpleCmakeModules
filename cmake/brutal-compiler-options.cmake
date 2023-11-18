# SCM_ prefix is used to mark variables that come from SimpleCmakeModules

set(SCM_MINIMUM_ALLOWED_GCC_VERSION "9.0")

# =======================================================================================================================================
# ============================================================= GCC OPTIONS =============================================================
# =======================================================================================================================================

# for gcc 9.x. These options will always be included, and when a greater compiler version is detected,
# the flags added in that version will be appended to this list (added flags are ones that are not enabled 
# by -Wall, -Wextra or any other flags in that specific compiler version)
set(SCM_GCC_9_OPTIONS
    -Werror                             # Make all warnings into errors.
    -Wfatal-errors                      # This option causes the compiler to abort compilation on the first error occurred rather than trying to keep going and printing further error messages.
    -Wall                               # This enables all the warnings about constructions that some users consider questionable, and that are easy to avoid 
    -Wextra                             # This enables some extra warning flags that are not enabled by -Wall.
    -pedantic-errors                    # Issue all the warnings demanded by strict ISO C and ISO C ++. Like -pedantic, except that errors are produced rather than warnings
    -Wctor-dtor-privacy                 # Warn when a class seems unusable because all the constructors or destructors in that class are private, and it has neither friends nor public static member functions.
    -Weffc++                            # Warn about violations of the following style guidelines from Scott Meyers' Effective C ++ book (std headers do not obey all guidelines!!)
    -Wstrict-null-sentinel              # Warn also about the use of an uncasted "NULL" as sentinel.
    -Wold-style-cast                    # Warn if an old-style (C-style) cast to a non-void type is used
    -Woverloaded-virtual                # Warn when a function declaration hides virtual functions from a base class
    -Wsign-promo                        # Warn when overload resolution chooses a promotion from unsigned or enumerated type to a signed type, over a conversion to an unsigned type of the same size
    -Wformat=2                          # Check calls to printf and scanf, etc., to make sure that the arguments supplied have types appropriate to the format string specified, and that the conversions specified in the format string make sense. Gives more errors than just -Wformat that is already included in -Wall
    -Wformat-overflow=2                 # Warn about calls to formatted input/output functions such as sprintf and vsprintf that might overflow the destination buffer.
    -Wformat-signedness                 # If -Wformat is specified, also warn if the format string requires an unsigned argument and the argument is signed and vice versa.
    -Wformat-truncation=2               # Warn about calls to formatted input/output functions such as snprintf and vsnprintf that might result in output truncation
    -Winit-self                         # Warn about uninitialized variables which are initialized with themselves
    -Wmissing-include-dirs              # Warn if a user-supplied include directory does not exist
    -Wswitch-default                    # Warn whenever a "switch" statement does not have a "default" case.
    -Wswitch-enum                       # Warn whenever a "switch" statement has an index of enumerated type and lacks a "case" for one or more of the named codes of that enumeration. "case" labels outside the enumeration range also provoke warnings when this option is used.
    -Wsync-nand                         # Warn when "__sync_fetch_and_nand" and "__sync_nand_and_fetch" built-in functions are used. These functions changed semantics in GCC 4.4.
    -Wunused-but-set-parameter          # Warn whenever a function parameter is assigned to, but otherwise unused (aside from its declaration).
    -Wunused-but-set-variable           # Warn whenever a local variable is assigned to, but otherwise unused (aside from its declaration)
    -Wunused-parameter                  # Warn whenever a function parameter is unused aside from its declaration.
    -Wunknown-pragmas                   # Warn when a #pragma directive is encountered which is not understood by GCC
    -Wstrict-overflow=4                 # warns about cases where the compiler optimizes based on the assumption that signed overflow does not occur
    -Wfloat-equal                       # Warn if floating point values are used in equality comparisons.
    -Wundef                             # Warn if an undefined identifier is evaluated in an #if directive.
    -Wshadow                            # Warn whenever a local variable shadows another local variable, parameter or global variable or whenever a built-in function is shadowed.
    -Wcast-qual                         # Warn whenever a pointer is cast so as to remove a type qualifier from the target type. 
    -Wcast-align                        # Warn whenever a pointer is cast such that the required alignment of the target is increased
    -Wconversion                        # Warn for implicit conversions that may alter a value.
    -Wsign-conversion                   # Warn for implicit conversions that may change the sign of an integer value
    -Wlogical-op                        # Warn about suspicious uses of logical operators in expressions
    -Wmissing-declarations              # Warn if a global function is defined without a previous declaration
    -Wmissing-noreturn                  # Warn about functions which might be candidates for attribute "noreturn".
    -Wmissing-format-attribute          # Warn about function pointers which might be candidates for "format" attributes. 
    -Wpacked                            # Warn if a structure is given the packed attribute, but the packed attribute has no effect on the layout or size of the structure
    -Wredundant-decls                   # Warn if anything is declared more than once in the same scope, even in cases where multiple declaration is valid and changes nothing.
    -Winvalid-pch                       # Warn if a precompiled header is found in the search path but can't be used.
    -Wvla                               # Warn if variable length array is used in the code.
    -Wdouble-promotion                  # Give a warning when a value of type float is implicitly promoted to double.
    -Wnull-dereference                  # Warn if the compiler detects paths that trigger erroneous or undefined behavior due to dereferencing a null pointer
    -Wimplicit-fallthrough              # Warn when a switch case falls through
    -Wunused-const-variable=1           # Warn whenever a constant static variable is unused aside from its declaration.
    -Wstringop-truncation               # Warn for calls to bounded string manipulation functions such as strncat, strncpy, and stpncpy that may either truncate the copied string or leave the destination unchanged.
    -Wsuggest-final-types               # Warn about types with virtual methods where code quality would be improved if the type were declared with the C++11 final specifier, or, if possible, declared in an anonymous namespace.
    -Wsuggest-final-methods             # Warn about virtual methods where code quality would be improved if the method were declared with the C++11 final specifier, or, if possible, its type were declared in an anonymous namespace or with the final specifier.
    -Wsuggest-override                  # Warn about overriding virtual functions that are not marked with the override keyword.
    -Walloca                            # This option warns on all uses of alloca in the source.
    -Wduplicated-branches               # Warn when an if-else has identical branches.
    -Wduplicated-cond                   # Warn about duplicated conditions in an if-else-if chain
    -Wplacement-new=2                   # Warn about placement new expressions with undefined behavior, such as constructing an object in a buffer that is smaller than the type of the object.
    -Wunused-macros                     # Warn about macros defined in the main file that are unused
    -Wconditionally-supported           # Warn for conditionally-supported constructs.
    -Wzero-as-null-pointer-constant     # Warn when a literal ‘0’ is used as null pointer constant. 
    -Wdate-time                         # Warn when macros __TIME__, __DATE__ or __TIMESTAMP__ are encountered as they might prevent bit-wise-identical reproducible compilations.
    -Wno-multichar                      # Do not warn if a multicharacter constant (‘'FOOF'’) is used. Usually they indicate a typo in the user’s code, as they have implementation-defined values, and should not be used in portable code.
    -Wvariadic-macros                   # Warn if variadic macros are used in ISO C90 mode, or if the GNU alternate syntax is used in ISO C99 mode
    -Wvarargs                           # Warn upon questionable usage of the macros used to handle variable arguments like va_start
    -Wextra-semi                        # Warn about redundant semicolon after in-class function definition.
    -Wuseless-cast                      # Warn when an expression is casted to its own type.
    -Wnoexcept                          # Warn when a noexcept-expression evaluates to false because of a call to a function that does not have a non-throwing exception specification (i.e. throw() or noexcept) but is known by the compiler to never throw an exception.
    -Wnoexcept-type                     # Warn if the C++17 feature making noexcept part of a function type changes the mangled name of a symbol relative to C++14.
    -Wregister                          # Warn on uses of the register storage class specifier, except when it is part of the GNU Explicit Register Variables extension
)

set(SCM_GCC_10_OPTIONS
    -Warith-conversion                  # Do warn about implicit conversions from arithmetic operations even when conversion of the operands to the same type cannot change their values.
    -Wzero-length-bounds                # Warn about accesses to elements of zero-length array members that might overlap other members of the same objec
    -Wrestrict                          # Warn when an object referenced by a restrict-qualified parameter (or, in C++, a __restrict-qualified parameter) is aliased by another argument, or when copies between such objects overlap
    -Wcomma-subscript                   # Warn about uses of a comma expression within a subscripting expression.
    -Wredundant-tags                    # Warn about redundant class-key and enum-key in references to class types and enumerated types in contexts where the key can be eliminated without causing an ambiguity
    -Wmismatched-tags                   # Warn for declarations of structs, classes, and class templates and their specializations with a class-key that does not match either the definition or the first declaration if no definition is provided
    -Wvolatile                          # Warn about deprecated uses of the volatile qualifier
    -Wcatch-value                       # Warn about catch handlers that do not catch via reference
    -Wsized-deallocation                # Warn about a definition of an unsized deallocation function
)

set(SCM_GCC_11_OPTIONS
    -Wenum-conversion                   # Warn when a value of enumerated type is implicitly converted to a different enumerated type
    -Winvalid-imported-macros           # Verify all imported macro definitions are valid at the end of compilation
    -Wctad-maybe-unsupported            # Warn when performing class template argument deduction (CTAD) on a type with no explicitly written deduction guides
)

set(SCM_GCC_12_OPTIONS
    -Wtrivial-auto-var-init             # Warn when -ftrivial-auto-var-init cannot initialize the automatic variable
    -Wbidi-chars=any,ucn                # Warn about possibly misleading UTF-8 bidirectional control characters in comments, string literals, character constants, and identifiers
    -Wopenacc-parallelism               # Warn about potentially suboptimal choices related to OpenACC parallelism.
    -Winterference-size                 # Warn about use of C++17 std::hardware_destructive_interference_size without specifying its value with --param destructive-interference-size. Also warn about questionable values for that option
)

set(SCM_GCC_13_OPTIONS
    -Winvalid-utf8                      # Warn if an invalid UTF-8 character is found.
    -Wxor-used-as-pow                   # Warn about uses of ^, the exclusive or operator, where it appears the user meant exponentiation
    -Winvalid-constexpr                 # Warn when a function never produces a constant expression. 
)

# currently unused warning flags that may produce a log of false positives:
# gcc 9.4:
#      -Wunsafe-loop-optimizations      # Warn if the loop cannot be optimized because the compiler could not assume anything on the bounds of the loop indices
    

function(add_brutal_compiler_options TARGET_NAME)
    if(TARGET ${TARGET_NAME})
        if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            set(SCM_GCC_COMPILE_OPTIONS)

            message(STATUS "Detected GNU compiler, version: " ${CMAKE_CXX_COMPILER_VERSION})

            if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "9.0.0")
                list(APPEND SCM_GCC_COMPILE_OPTIONS ${SCM_GCC_9_OPTIONS})
            elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "10.0.0")
                list(APPEND SCM_GCC_COMPILE_OPTIONS ${SCM_GCC_10_OPTIONS})
            elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "11.0.0")
                list(APPEND SCM_GCC_COMPILE_OPTIONS ${SCM_GCC_11_OPTIONS})
            elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "12.0.0")
                list(APPEND SCM_GCC_COMPILE_OPTIONS ${SCM_GCC_12_OPTIONS})
            elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "13.0.0")
                list(APPEND SCM_GCC_COMPILE_OPTIONS ${SCM_GCC_13_OPTIONS})
            else()
                message(FATAL_ERROR "Error: GNU compiler version must be at least 9.0.0")
            endif()

            target_compile_options(${TARGET_NAME} PRIVATE ${SCM_GCC_COMPILE_OPTIONS})
        elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
            set(SCM_CLANG_COMPILE_OPTIONS)

            message(STATUS "Detected Clang compiler, version: " ${CMAKE_CXX_COMPILER_VERSION})

            target_compile_options(${TARGET_NAME} PRIVATE ${SCM_CLANG_COMPILE_OPTIONS})
        elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
            set(SCM_MSVC_COMPILE_OPTIONS)

            message(STATUS "Detected MSVC compiler, version: " ${CMAKE_CXX_COMPILER_VERSION})

            target_compile_options(${TARGET_NAME} PRIVATE ${SCM_MSVC_COMPILE_OPTIONS})
        else()
            message("Compiler: Unknown or unsupported compiler")
        endif()
        
    else()
        message("Error: Target '${TARGET_NAME}' not found.")
    endif()
endfunction()
