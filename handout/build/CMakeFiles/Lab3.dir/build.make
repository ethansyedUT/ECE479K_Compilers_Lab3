# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /code

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /code/build

# Include any dependencies generated for this target.
include CMakeFiles/Lab3.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/Lab3.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/Lab3.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Lab3.dir/flags.make

CMakeFiles/Lab3.dir/UnitLICM.cpp.o: CMakeFiles/Lab3.dir/flags.make
CMakeFiles/Lab3.dir/UnitLICM.cpp.o: ../UnitLICM.cpp
CMakeFiles/Lab3.dir/UnitLICM.cpp.o: CMakeFiles/Lab3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Lab3.dir/UnitLICM.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Lab3.dir/UnitLICM.cpp.o -MF CMakeFiles/Lab3.dir/UnitLICM.cpp.o.d -o CMakeFiles/Lab3.dir/UnitLICM.cpp.o -c /code/UnitLICM.cpp

CMakeFiles/Lab3.dir/UnitLICM.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Lab3.dir/UnitLICM.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /code/UnitLICM.cpp > CMakeFiles/Lab3.dir/UnitLICM.cpp.i

CMakeFiles/Lab3.dir/UnitLICM.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Lab3.dir/UnitLICM.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /code/UnitLICM.cpp -o CMakeFiles/Lab3.dir/UnitLICM.cpp.s

CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.o: CMakeFiles/Lab3.dir/flags.make
CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.o: ../UnitLoopInfo.cpp
CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.o: CMakeFiles/Lab3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.o -MF CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.o.d -o CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.o -c /code/UnitLoopInfo.cpp

CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /code/UnitLoopInfo.cpp > CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.i

CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /code/UnitLoopInfo.cpp -o CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.s

CMakeFiles/Lab3.dir/UnitSCCP.cpp.o: CMakeFiles/Lab3.dir/flags.make
CMakeFiles/Lab3.dir/UnitSCCP.cpp.o: ../UnitSCCP.cpp
CMakeFiles/Lab3.dir/UnitSCCP.cpp.o: CMakeFiles/Lab3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Lab3.dir/UnitSCCP.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Lab3.dir/UnitSCCP.cpp.o -MF CMakeFiles/Lab3.dir/UnitSCCP.cpp.o.d -o CMakeFiles/Lab3.dir/UnitSCCP.cpp.o -c /code/UnitSCCP.cpp

CMakeFiles/Lab3.dir/UnitSCCP.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Lab3.dir/UnitSCCP.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /code/UnitSCCP.cpp > CMakeFiles/Lab3.dir/UnitSCCP.cpp.i

CMakeFiles/Lab3.dir/UnitSCCP.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Lab3.dir/UnitSCCP.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /code/UnitSCCP.cpp -o CMakeFiles/Lab3.dir/UnitSCCP.cpp.s

CMakeFiles/Lab3.dir/RegisterPasses.cpp.o: CMakeFiles/Lab3.dir/flags.make
CMakeFiles/Lab3.dir/RegisterPasses.cpp.o: ../RegisterPasses.cpp
CMakeFiles/Lab3.dir/RegisterPasses.cpp.o: CMakeFiles/Lab3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/Lab3.dir/RegisterPasses.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Lab3.dir/RegisterPasses.cpp.o -MF CMakeFiles/Lab3.dir/RegisterPasses.cpp.o.d -o CMakeFiles/Lab3.dir/RegisterPasses.cpp.o -c /code/RegisterPasses.cpp

CMakeFiles/Lab3.dir/RegisterPasses.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Lab3.dir/RegisterPasses.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /code/RegisterPasses.cpp > CMakeFiles/Lab3.dir/RegisterPasses.cpp.i

CMakeFiles/Lab3.dir/RegisterPasses.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Lab3.dir/RegisterPasses.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /code/RegisterPasses.cpp -o CMakeFiles/Lab3.dir/RegisterPasses.cpp.s

# Object files for target Lab3
Lab3_OBJECTS = \
"CMakeFiles/Lab3.dir/UnitLICM.cpp.o" \
"CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.o" \
"CMakeFiles/Lab3.dir/UnitSCCP.cpp.o" \
"CMakeFiles/Lab3.dir/RegisterPasses.cpp.o"

# External object files for target Lab3
Lab3_EXTERNAL_OBJECTS =

libLab3.so: CMakeFiles/Lab3.dir/UnitLICM.cpp.o
libLab3.so: CMakeFiles/Lab3.dir/UnitLoopInfo.cpp.o
libLab3.so: CMakeFiles/Lab3.dir/UnitSCCP.cpp.o
libLab3.so: CMakeFiles/Lab3.dir/RegisterPasses.cpp.o
libLab3.so: CMakeFiles/Lab3.dir/build.make
libLab3.so: CMakeFiles/Lab3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/code/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library libLab3.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Lab3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Lab3.dir/build: libLab3.so
.PHONY : CMakeFiles/Lab3.dir/build

CMakeFiles/Lab3.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Lab3.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Lab3.dir/clean

CMakeFiles/Lab3.dir/depend:
	cd /code/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /code /code /code/build /code/build /code/build/CMakeFiles/Lab3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Lab3.dir/depend

