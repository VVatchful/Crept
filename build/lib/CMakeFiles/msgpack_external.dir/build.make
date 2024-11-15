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
CMAKE_SOURCE_DIR = /home/watchful/projects/c_projects/Crept

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/watchful/projects/c_projects/Crept/build

# Utility rule file for msgpack_external.

# Include any custom commands dependencies for this target.
include lib/CMakeFiles/msgpack_external.dir/compiler_depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/msgpack_external.dir/progress.make

lib/CMakeFiles/msgpack_external: lib/CMakeFiles/msgpack_external-complete

lib/CMakeFiles/msgpack_external-complete: msgpack/src/msgpack_external-stamp/msgpack_external-install
lib/CMakeFiles/msgpack_external-complete: msgpack/src/msgpack_external-stamp/msgpack_external-mkdir
lib/CMakeFiles/msgpack_external-complete: msgpack/src/msgpack_external-stamp/msgpack_external-download
lib/CMakeFiles/msgpack_external-complete: msgpack/src/msgpack_external-stamp/msgpack_external-update
lib/CMakeFiles/msgpack_external-complete: msgpack/src/msgpack_external-stamp/msgpack_external-patch
lib/CMakeFiles/msgpack_external-complete: msgpack/src/msgpack_external-stamp/msgpack_external-configure
lib/CMakeFiles/msgpack_external-complete: msgpack/src/msgpack_external-stamp/msgpack_external-build
lib/CMakeFiles/msgpack_external-complete: msgpack/src/msgpack_external-stamp/msgpack_external-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/watchful/projects/c_projects/Crept/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'msgpack_external'"
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E make_directory /home/watchful/projects/c_projects/Crept/build/lib/CMakeFiles
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E touch /home/watchful/projects/c_projects/Crept/build/lib/CMakeFiles/msgpack_external-complete
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E touch /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-stamp/msgpack_external-done

msgpack/src/msgpack_external-stamp/msgpack_external-build: msgpack/src/msgpack_external-stamp/msgpack_external-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/watchful/projects/c_projects/Crept/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing build step for 'msgpack_external'"
	cd /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-build && $(MAKE)
	cd /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-build && /usr/bin/cmake -E touch /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-stamp/msgpack_external-build

msgpack/src/msgpack_external-stamp/msgpack_external-configure: msgpack/tmp/msgpack_external-cfgcmd.txt
msgpack/src/msgpack_external-stamp/msgpack_external-configure: msgpack/src/msgpack_external-stamp/msgpack_external-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/watchful/projects/c_projects/Crept/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Performing configure step for 'msgpack_external'"
	cd /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-build && /usr/bin/cmake -DCMAKE_INSTALL_PREFIX=/home/watchful/projects/c_projects/Crept/build/msgpack -DMSGPACK_BUILD_EXAMPLES=OFF -DMSGPACK_BUILD_TESTS=OFF -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DCMAKE_BUILD_TYPE=Release "-GUnix Makefiles" /home/watchful/projects/c_projects/Crept/lib/msgpack-c
	cd /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-build && /usr/bin/cmake -E touch /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-stamp/msgpack_external-configure

msgpack/src/msgpack_external-stamp/msgpack_external-download: msgpack/src/msgpack_external-stamp/msgpack_external-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/watchful/projects/c_projects/Crept/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "No download step for 'msgpack_external'"
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E echo_append
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E touch /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-stamp/msgpack_external-download

msgpack/src/msgpack_external-stamp/msgpack_external-install: msgpack/src/msgpack_external-stamp/msgpack_external-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/watchful/projects/c_projects/Crept/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Performing install step for 'msgpack_external'"
	cd /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-build && /usr/bin/cmake --build . --target install
	cd /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-build && /usr/bin/cmake -E touch /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-stamp/msgpack_external-install

msgpack/src/msgpack_external-stamp/msgpack_external-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/watchful/projects/c_projects/Crept/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'msgpack_external'"
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E make_directory /home/watchful/projects/c_projects/Crept/lib/msgpack-c
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E make_directory /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-build
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E make_directory /home/watchful/projects/c_projects/Crept/build/msgpack
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E make_directory /home/watchful/projects/c_projects/Crept/build/msgpack/tmp
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E make_directory /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-stamp
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E make_directory /home/watchful/projects/c_projects/Crept/build/msgpack/src
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E make_directory /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-stamp
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E touch /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-stamp/msgpack_external-mkdir

msgpack/src/msgpack_external-stamp/msgpack_external-patch: msgpack/src/msgpack_external-stamp/msgpack_external-update
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/watchful/projects/c_projects/Crept/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'msgpack_external'"
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E echo_append
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E touch /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-stamp/msgpack_external-patch

msgpack/src/msgpack_external-stamp/msgpack_external-update: msgpack/src/msgpack_external-stamp/msgpack_external-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/watchful/projects/c_projects/Crept/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No update step for 'msgpack_external'"
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E echo_append
	cd /home/watchful/projects/c_projects/Crept/build/lib && /usr/bin/cmake -E touch /home/watchful/projects/c_projects/Crept/build/msgpack/src/msgpack_external-stamp/msgpack_external-update

msgpack_external: lib/CMakeFiles/msgpack_external
msgpack_external: lib/CMakeFiles/msgpack_external-complete
msgpack_external: msgpack/src/msgpack_external-stamp/msgpack_external-build
msgpack_external: msgpack/src/msgpack_external-stamp/msgpack_external-configure
msgpack_external: msgpack/src/msgpack_external-stamp/msgpack_external-download
msgpack_external: msgpack/src/msgpack_external-stamp/msgpack_external-install
msgpack_external: msgpack/src/msgpack_external-stamp/msgpack_external-mkdir
msgpack_external: msgpack/src/msgpack_external-stamp/msgpack_external-patch
msgpack_external: msgpack/src/msgpack_external-stamp/msgpack_external-update
msgpack_external: lib/CMakeFiles/msgpack_external.dir/build.make
.PHONY : msgpack_external

# Rule to build all files generated by this target.
lib/CMakeFiles/msgpack_external.dir/build: msgpack_external
.PHONY : lib/CMakeFiles/msgpack_external.dir/build

lib/CMakeFiles/msgpack_external.dir/clean:
	cd /home/watchful/projects/c_projects/Crept/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/msgpack_external.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/msgpack_external.dir/clean

lib/CMakeFiles/msgpack_external.dir/depend:
	cd /home/watchful/projects/c_projects/Crept/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/watchful/projects/c_projects/Crept /home/watchful/projects/c_projects/Crept/lib /home/watchful/projects/c_projects/Crept/build /home/watchful/projects/c_projects/Crept/build/lib /home/watchful/projects/c_projects/Crept/build/lib/CMakeFiles/msgpack_external.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/msgpack_external.dir/depend

