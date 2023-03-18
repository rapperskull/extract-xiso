cmake_minimum_required(VERSION 3.20)
project(extract-xiso)

string(TOUPPER __${CMAKE_SYSTEM_NAME}__ TARGET_OS)

set(SOURCE_FILES
	extract-xiso.c
)

if(MSVC)
    add_compile_options(/W4)
    add_definitions(-D_CRT_NONSTDC_NO_WARNINGS) # POSIX function names
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)  # Unsafe CRT Library functions
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
        add_definitions(-DDEBUG=1)
    endif()
else()
    add_compile_options(-Wall -Wextra -Wpedantic -Wno-comment)
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
        add_definitions(-DDEBUG=1)
    else()
        add_compile_options(-O2)
    endif()
endif()
add_executable(extract-xiso ${SOURCE_FILES})
target_compile_definitions(extract-xiso PRIVATE ${TARGET_OS})
if(CMAKE_C_BYTE_ORDER MATCHES "^$")
    set(CMAKE_C_BYTE_ORDER UNK_ENDIAN)
endif()
target_compile_definitions(extract-xiso PRIVATE CMAKE_ENDIANNESS=${CMAKE_C_BYTE_ORDER})
set_property(TARGET extract-xiso PROPERTY C_STANDARD 99)
set_property(TARGET extract-xiso PROPERTY C_EXTENSIONS OFF)
install(TARGETS extract-xiso RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}/bin")
