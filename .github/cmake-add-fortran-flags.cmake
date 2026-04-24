# Included via CMAKE_PROJECT_INCLUDE (set in cmake-flags-intel-classic.cmake).
# This file is loaded after project() returns, so:
#  - the cmake compiler test has already run (unaffected)
#  - ecbuild's CMAKE_Fortran_FLAGS_DEBUG is set afterwards with FORCE
#
# add_compile_options() appends to COMPILE_OPTIONS, which cmake places
# *after* CMAKE_Fortran_FLAGS and CMAKE_Fortran_FLAGS_DEBUG in the compiler
# invocation.  On Intel Classic, ecbuild's Debug flags include "-check all".
# Adding "-check noarg_temp_created" via COMPILE_OPTIONS ensures it appears
# after "-check all" on the ifort command line, correctly disabling only the
# temporary-array-creation check (noarg_temp_created) while leaving every
# other check enabled.
if(CMAKE_Fortran_COMPILER_ID MATCHES "Intel")
    add_compile_options(
        $<$<COMPILE_LANGUAGE:Fortran>:-check>
        $<$<COMPILE_LANGUAGE:Fortran>:noarg_temp_created>
    )
endif()
