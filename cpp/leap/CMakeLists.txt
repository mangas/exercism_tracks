cmake_minimum_required(VERSION 3.12)
project(leap)

set(CMAKE_CXX_STANDARD 14)

add_executable(leap
        CMakeLists.txt
        leap_test.cpp
        README.md)
