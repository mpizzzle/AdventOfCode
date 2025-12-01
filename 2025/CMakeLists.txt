cmake_minimum_required(VERSION 3.5)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS_RELEASE " -03 ")
add_compile_options("-Wall" "-Wextra" "-Werror" "-pedantic")

project(aoc-2025)

file(GLOB SOURCES *.cpp)
file(GLOB HEADERS *.h)

add_executable(puzzle ${HEADERS} ${SOURCES})
