cmake_minimum_required(VERSION 3.10)
project(cpp-cmake-docker-example LANGUAGES CXX)


file(GLOB_RECURSE SOURCES "${CMAKE_SOURCE_DIR}/src/*.cpp")

add_executable(${PROJECT_NAME} ${SOURCES})
target_include_directories(${PROJECT_NAME} PRIVATE "${CMAKE_SOURCE_DIR}/include/")
target_include_directories(${PROJECT_NAME} PRIVATE "${CMAKE_SOURCE_DIR}/.")


set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set_target_properties(${PROJECT_NAME} PROPERTIES CXX_EXTENSIONS OFF)

set(default_build_type "Release")

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS "Setting build type to '${default_build_type}' as none was specified.")
  set(CMAKE_BUILD_TYPE "${default_build_type}" CACHE STRING "Choose the type of build." FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

add_compile_options(
  -Wall -Wno-unused-parameter
   $<$<CONFIG:RELEASE>:-Ofast>
   $<$<CONFIG:RELEASE>:-flto>
   $<$<CONFIG:RELEASE>:-DNDEBUG>
   $<$<CONFIG:DEBUG>:-O0>
   $<$<CONFIG:DEBUG>:-g>
)

install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin)
