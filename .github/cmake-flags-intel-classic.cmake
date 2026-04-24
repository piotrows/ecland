# CMake initial cache file for Intel Classic (ifort) compiler.
# Passed via -C flag so cmake's own language parser handles the path correctly.
#
# We use CMAKE_PROJECT_INCLUDE rather than setting CMAKE_Fortran_FLAGS here
# because ecbuild sets CMAKE_Fortran_FLAGS_DEBUG (with FORCE) to its own Debug
# flags (e.g. "-O0 -g -traceback -heap-arrays 32 -check all"), which would
# override any value we place in CMAKE_Fortran_FLAGS via this initial cache.
#
# CMAKE_PROJECT_INCLUDE points to a file that is included after project()
# returns.  That file uses add_compile_options(), which appends to COMPILE_OPTIONS.
# cmake places COMPILE_OPTIONS *after* CMAKE_Fortran_FLAGS and
# CMAKE_Fortran_FLAGS_<CONFIG> in the compiler invocation, so
# -check noarg_temp_created is guaranteed to follow ecbuild's -check all,
# correctly disabling only the temporary-array-creation warning.
set(CMAKE_PROJECT_INCLUDE
    "${CMAKE_CURRENT_LIST_DIR}/cmake-add-fortran-flags.cmake"
    CACHE STRING "" FORCE)
