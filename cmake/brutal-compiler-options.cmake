
set(MINIMUM_ALLOWED_GCC_VERSION "9.0")

# for gcc 9.x
set(GCC_9_OPTIONS
    -Werror # Make all warnings into errors.
    -Wfatal-errors # This option causes the compiler to abort compilation on the first error occurred rather than trying to keep going and printing further error messages.

    # -pedantic # Issue all the warnings demanded by strict ISO C and ISO C ++ 
    -pedantic-errors # Like -pedantic, except that errors are produced rather than warnings

    -Wall # This enables all the warnings about constructions that some users consider questionable, and that are easy to avoid 
        # CONTAINS
        # -Waddress -Warray-bounds (only with -O2) -Wc++0x-compat -Wchar-subscripts -Wimplicit-int -Wimplicit-function-declaration -Wcomment 
        # -Wformat -Wmain (only for C/ObjC and unless -ffreestanding) -Wmissing-braces -Wnonnull -Wparentheses -Wpointer-sign -Wreorder -Wreturn-type 
        # -Wsequence-point -Wsign-compare (only in C ++ ) -Wstrict-aliasing -Wstrict-overflow=1 -Wswitch -Wtrigraphs -Wuninitialized -Wunknown-pragmas 
        # -Wunused-function -Wunused-label -Wunused-value -Wunused-variable -Wvolatile-register-var
   
    -Wextra #This enables some extra warning flags that are not enabled by -Wall.
        # CONTAINS
        # -Wclobbered -Wempty-body -Wignored-qualifiers -Wmissing-field-initializers -Wmissing-parameter-type (C only)
        # -Wold-style-declaration (C only) -Woverride-init -Wsign-compare -Wtype-limits -Wuninitialized 
        # -Wunused-parameter (only with -Wunused or -Wall)

    # -Wabi # Warn when G++ generates code that is probably not compatible with the vendor-neutral C ++ ABI (not 100% fullproof)
    -Wctor-dtor-privacy # Warn when a class seems unusable because all the constructors or destructors in that class are private, and it has neither friends nor public static member functions.
    -Weffc++ # Warn about violations of the following style guidelines from Scott Meyers' Effective C ++ book (std headers do not obey all guidelines!!)
    -Wstrict-null-sentinel # Warn also about the use of an uncasted "NULL" as sentinel.
    -Wold-style-cast # Warn if an old-style (C-style) cast to a non-void type is used
    -Woverloaded-virtual # Warn when a function declaration hides virtual functions from a base class
    -Wsign-promo # Warn when overload resolution chooses a promotion from unsigned or enumerated type to a signed type, over a conversion to an unsigned type of the same size
    -Wformat=2 # (-Wformat ALSO IN -Wall) gives more errors than just -Wformat
    -Winit-self # Warn about uninitialized variables which are initialized with themselves
    -Wmissing-include-dirs # Warn if a user-supplied include directory does not exist
    -Wswitch-default # Warn whenever a "switch" statement does not have a "default" case.
    -Wswitch-enum # Warn whenever a "switch" statement has an index of enumerated type and lacks a "case" for one or more of the named codes of that enumeration. "case" labels outside the enumeration range also provoke warnings when this option is used.
    -Wsync-nand # Warn when "__sync_fetch_and_nand" and "__sync_nand_and_fetch" built-in functions are used. These functions changed semantics in GCC 4.4.
    -Wunused-but-set-parameter # Warn whenever a function parameter is assigned to, but otherwise unused (aside from its declaration).
    -Wunused-but-set-variable # Warn whenever a local variable is assigned to, but otherwise unused (aside from its declaration)
    -Wunused-parameter # Warn whenever a function parameter is unused aside from its declaration.
    -Wunknown-pragmas # Warn when a #pragma directive is encountered which is not understood by GCC
    
    -Wstrict-overflow=4 # warns about cases where the compiler optimizes based on the assumption that signed overflow does not occur
        # IMA I -Wstrict-overflow=5 ALI KAZE MNOGO FALSE POSITIVES
    
    -Wfloat-equal # Warn if floating point values are used in equality comparisons.
    -Wundef # Warn if an undefined identifier is evaluated in an #if directive.
    -Wshadow # Warn whenever a local variable shadows another local variable, parameter or global variable or whenever a built-in function is shadowed.
    -Wunsafe-loop-optimizations # MOZDA PREVISE ALEGEDLY FALSE POSITIVES Warn if the loop cannot be optimized because the compiler could not assume anything on the bounds of the loop indices
    -Wcast-qual # Warn whenever a pointer is cast so as to remove a type qualifier from the target type. 
    -Wcast-align # Warn whenever a pointer is cast such that the required alignment of the target is increased
    -Wconversion # Warn for implicit conversions that may alter a value.
    -Wsign-conversion # Warn for implicit conversions that may change the sign of an integer value
    -Wlogical-op # Warn about suspicious uses of logical operators in expressions
    -Wmissing-declarations # Warn if a global function is defined without a previous declaration
    -Wmissing-noreturn # Warn about functions which might be candidates for attribute "noreturn".
    -Wmissing-format-attribute # Warn about function pointers which might be candidates for "format" attributes. 

    -Wpacked # Warn if a structure is given the packed attribute, but the packed attribute has no effect on the layout or size of the structure

    # -Wpadded # OVO JE VRV PREVISE Warn if padding is included in a structure, either to align an element of the structure or to align the whole structure. 

    -Wredundant-decls # Warn if anything is declared more than once in the same scope, even in cases where multiple declaration is valid and changes nothing.

    # -Wunreachable-code  # OVO JE VRV PREVISE JER FALSE POSITIVES DOK DEBAGUJES # Warn if the compiler detects that code will never be executed

    # -Winline # MOZDA PREVISE JER JE BAS RANDOM  Warn if a function can not be inlined and it was declared as inline.

    -Winvalid-pch # Warn if a precompiled header is found in the search path but can't be used.

    -Wvla # Warn if variable length array is used in the code.
    

    # gcc 9.5
    # iz sekcije warning options
    -Wdouble-promotion # MOZDA JE PREVISE? Give a warning when a value of type float is implicitly promoted to double.
    -Wnull-dereference # Warn if the compiler detects paths that trigger erroneous or undefined behavior due to dereferencing a null pointer
    -Wimplicit-fallthrough # Warn when a switch case falls through
    -Wunused-const-variable=1 # Warn whenever a constant static variable is unused aside from its declaration.
    -Wstringop-truncation # Warn for calls to bounded string manipulation functions such as strncat, strncpy, and stpncpy that may either truncate the copied string or leave the destination unchanged.
    -Wsuggest-final-types # MOZDA PREVISE? Warn about types with virtual methods where code quality would be improved if the type were declared with the C++11 final specifier, or, if possible, declared in an anonymous namespace.
    -Wsuggest-final-methods # MOZDA PREVISE Warn about virtual methods where code quality would be improved if the method were declared with the C++11 final specifier, or, if possible, its type were declared in an anonymous namespace or with the final specifier.
    -Wsuggest-override # Warn about overriding virtual functions that are not marked with the override keyword.
    -Walloca # This option warns on all uses of alloca in the source.
    -Wduplicated-branches # Warn when an if-else has identical branches.
    -Wduplicated-cond # Warn about duplicated conditions in an if-else-if chain
    -Wplacement-new=2 # Warn about placement new expressions with undefined behavior, such as constructing an object in a buffer that is smaller than the type of the object.
    -Wunused-macros # Warn about macros defined in the main file that are unused
    -Wconditionally-supported # MOZDA PREVISE NE ZNAM STA JE OVO Warn for conditionally-supported constructs.
    -Wzero-as-null-pointer-constant # Warn when a literal ‘0’ is used as null pointer constant. 
    -Wdate-time # Warn when macros __TIME__, __DATE__ or __TIMESTAMP__ are encountered as they might prevent bit-wise-identical reproducible compilations.
    -Wuseless-cast # Warn when an expression is casted to its own type.
    -Wextra-semi # Warn about redundant semicolon after in-class function definition.
    -Wno-multichar # Do not warn if a multicharacter constant (‘'FOOF'’) is used. Usually they indicate a typo in the user’s code, as they have implementation-defined values, and should not be used in portable code.
    -Wvariadic-macros # Warn if variadic macros are used in ISO C90 mode, or if the GNU alternate syntax is used in ISO C99 mode
    -Wvarargs # Warn upon questionable usage of the macros used to handle variable arguments like va_start
    


    # iz sekcije c++ dialect
    -Wnoexcept # Warn when a noexcept-expression evaluates to false because of a call to a function that does not have a non-throwing exception specification (i.e. throw() or noexcept) but is known by the compiler to never throw an exception.
    -Wnoexcept-type # Warn if the C++17 feature making noexcept part of a function type changes the mangled name of a symbol relative to C++14.
    -Wregister # Warn on uses of the register storage class specifier, except when it is part of the GNU Explicit Register Variables extension

)

set(GCC_10_OPTIONS -Wall)



set(CLANG_OPTIONS_BRUTAL -Wall)
set(MSVC_OPTIONS_BRUTAL /Wx)




function(add_brutal_compiler_options TARGET_NAME)
    if(TARGET ${TARGET_NAME})
        if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
            set(GCC_COMPILE_OPTIONS)

            message(STATUS "Detected GNU compiler, version " ${CMAKE_CXX_COMPILER_VERSION})

            # Check if the compiler version is greater than or equal to the minimum required version
            if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "9.0.0")
                list(APPEND GCC_COMPILE_OPTIONS ${GCC_9_OPTIONS})
            elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "10.0.0")
                list(APPEND GCC_COMPILE_OPTIONS ${GCC_10_OPTIONS})
            else()
                message(FATAL_ERROR "Error: Compiler version must be at least 9.0.0")
            endif()

            target_compile_options(${TARGET_NAME} PRIVATE ${GCC_COMPILE_OPTIONS})

        elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
            target_compile_options(${TARGET_NAME} PRIVATE ${CLANG_OPTIONS_BRUTAL})
        elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
            target_compile_options(${TARGET_NAME} PRIVATE ${MSVC_OPTIONS_BRUTAL})
        else()
            message("Compiler: Unknown or unsupported compiler")
        endif()
        
    else()
        message("Error: Target '${TARGET_NAME}' not found.")
    endif()
endfunction()




set(GCC_OPTIONS_REASONABLE -Wall)

set(CLANG_OPTIONS_REASONABLE -Wall)

set(MSVC_OPTIONS_REASONABLE /Wx)
