set(CMAKE_SYSTEM_NAME FreeBSD)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

set(TARGET x86_64-pc-freebsd)

set(CMAKE_C_COMPILER clang)
set(CMAKE_C_COMPILER_TARGET ${TARGET})
set(CMAKE_AR ar)
set(CMAKE_AR_TARGET ${TARGET})
set(CMAKE_LD lld)
set(CMAKE_LD_TARGET ${TARGET})

set(CMAKE_SYSROOT $ENV{SYSROOT_PATH})

# these variables tell CMake to avoid using any binary it finds in 
# the sysroot, while picking headers and libraries exclusively from it 
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
