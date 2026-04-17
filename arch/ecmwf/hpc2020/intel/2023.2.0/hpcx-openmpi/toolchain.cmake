if(CMAKE_Fortran_COMPILER_ID MATCHES "Intel")
  ecbuild_add_fortran_flags( "-check noarg_temp_created" NAME arg_temp_created )
endif()
