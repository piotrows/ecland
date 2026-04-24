# CMake initial cache file for Intel Classic (ifort) compiler.
# Passed via -C flag so cmake's own language parser handles quoting correctly,
# avoiding issues with shell quoting when flags contain spaces.
set(CMAKE_Fortran_FLAGS "-check noarg_temp_created" CACHE STRING "" FORCE)
