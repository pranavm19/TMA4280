# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.4

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/sw/sdev/Modules/cmake/cmake-3.4.3/bin/cmake

# The command to remove a file.
RM = /home/sw/sdev/Modules/cmake/cmake-3.4.3/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ntnu/pranavm/TMA4280/Project2/Test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ntnu/pranavm/TMA4280/Project2/Test/build

# Include any dependencies generated for this target.
include CMakeFiles/poisson.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/poisson.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/poisson.dir/flags.make

CMakeFiles/poisson.dir/poisson.c.o: CMakeFiles/poisson.dir/flags.make
CMakeFiles/poisson.dir/poisson.c.o: ../poisson.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ntnu/pranavm/TMA4280/Project2/Test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/poisson.dir/poisson.c.o"
	/sw/sgi/mpt/mpt-2.11/bin/mpicc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/poisson.dir/poisson.c.o   -c /home/ntnu/pranavm/TMA4280/Project2/Test/poisson.c

CMakeFiles/poisson.dir/poisson.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/poisson.dir/poisson.c.i"
	/sw/sgi/mpt/mpt-2.11/bin/mpicc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ntnu/pranavm/TMA4280/Project2/Test/poisson.c > CMakeFiles/poisson.dir/poisson.c.i

CMakeFiles/poisson.dir/poisson.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/poisson.dir/poisson.c.s"
	/sw/sgi/mpt/mpt-2.11/bin/mpicc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ntnu/pranavm/TMA4280/Project2/Test/poisson.c -o CMakeFiles/poisson.dir/poisson.c.s

CMakeFiles/poisson.dir/poisson.c.o.requires:

.PHONY : CMakeFiles/poisson.dir/poisson.c.o.requires

CMakeFiles/poisson.dir/poisson.c.o.provides: CMakeFiles/poisson.dir/poisson.c.o.requires
	$(MAKE) -f CMakeFiles/poisson.dir/build.make CMakeFiles/poisson.dir/poisson.c.o.provides.build
.PHONY : CMakeFiles/poisson.dir/poisson.c.o.provides

CMakeFiles/poisson.dir/poisson.c.o.provides.build: CMakeFiles/poisson.dir/poisson.c.o


# Object files for target poisson
poisson_OBJECTS = \
"CMakeFiles/poisson.dir/poisson.c.o"

# External object files for target poisson
poisson_EXTERNAL_OBJECTS =

poisson: CMakeFiles/poisson.dir/poisson.c.o
poisson: CMakeFiles/poisson.dir/build.make
poisson: libcommon.a
poisson: /sw/sgi/mpt/mpt-2.11/lib/libmpi.so
poisson: CMakeFiles/poisson.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ntnu/pranavm/TMA4280/Project2/Test/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable poisson"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/poisson.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/poisson.dir/build: poisson

.PHONY : CMakeFiles/poisson.dir/build

CMakeFiles/poisson.dir/requires: CMakeFiles/poisson.dir/poisson.c.o.requires

.PHONY : CMakeFiles/poisson.dir/requires

CMakeFiles/poisson.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/poisson.dir/cmake_clean.cmake
.PHONY : CMakeFiles/poisson.dir/clean

CMakeFiles/poisson.dir/depend:
	cd /home/ntnu/pranavm/TMA4280/Project2/Test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ntnu/pranavm/TMA4280/Project2/Test /home/ntnu/pranavm/TMA4280/Project2/Test /home/ntnu/pranavm/TMA4280/Project2/Test/build /home/ntnu/pranavm/TMA4280/Project2/Test/build /home/ntnu/pranavm/TMA4280/Project2/Test/build/CMakeFiles/poisson.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/poisson.dir/depend

