BUILD_TYPE_LINUX = Debug
# BUILD_TYPE_LINUX = Release
GENERATOR_LINUX = "Unix Makefiles"
# COMPILER_LINUX = g++
COMPILER_LINUX = clang++

do_cmake_linux:
	rm -rf build && \
	mkdir build &&	\
	cd build &&	\
	cmake -G $(GENERATOR_LINUX) \
		  -DCMAKE_CXX_COMPILER=$(COMPILER_LINUX) \
		  -DCMAKE_BUILD_TYPE=$(BUILD_TYPE_LINUX) \
		  .. && \
	cmake --build . && \
	./src/main

# =====================================================================================================

BUILD_TYPE_WINDOWS = Debug
# BUILD_TYPE_WINDOWS = Release
GENERATOR_WINDOWS = "Visual Studio 17 2022"

do_cmake_windows:
	echo Y | \
	rmdir /S build && \
	mkdir build &&	\
	cd build &&	\
	cmake -G $(GENERATOR_WINDOWS) \
		  .. && \
	cmake --build . --config $(BUILD_TYPE_WINDOWS)
