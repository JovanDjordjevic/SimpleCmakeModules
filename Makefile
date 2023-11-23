BUILD_TYPE_LINUX = Debug
# BUILD_TYPE_LINUX = Release
GENERATOR_LINUX = "Unix Makefiles"
COMPILER_LINUX = g++
# COMPILER_LINUX = clang++

ENABLE_DOXYGEN_LINUX = ON
ENABLE_TESTING_LINUX = ON
ENABLE_COVERAGE_REPORT_LINUX = ON
ENABLE_BUILD_EXAMPLES_LINUX = ON

do_cmake_linux:
	rm -rf build && \
	mkdir build &&	\
	cd build &&	\
	cmake -G $(GENERATOR_LINUX) \
		  -DCMAKE_CXX_COMPILER=$(COMPILER_LINUX) \
		  -DCMAKE_BUILD_TYPE=$(BUILD_TYPE_LINUX) \
		  .. && \
	cmake --build . && \
	./main
