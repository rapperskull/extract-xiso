cmake_minimum_required(VERSION 3.1)
project(extract-xiso)

string(TOUPPER __${CMAKE_SYSTEM_NAME}__ TARGET_OS)

set(SOURCE_FILES
	extract-xiso.c
)

add_executable(extract-xiso ${SOURCE_FILES})
target_compile_definitions(extract-xiso PRIVATE ${TARGET_OS})
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  add_definitions(-DDEBUG=1)
endif()
set_property(TARGET extract-xiso PROPERTY C_STANDARD 90)
install(TARGETS extract-xiso RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}/bin")
