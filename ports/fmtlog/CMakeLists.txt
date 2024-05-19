cmake_minimum_required(VERSION 3.15)

project(fmtlog CXX)

option(BUILD_SHARED_LIB "" OFF)

if(MSVC)
    add_compile_options(/std:c++latest)
else()
    add_compile_options(-Wall -O3 -std=c++17)
    link_libraries(pthread)
endif()

find_library(FMT NAMES fmt)
find_path(FMT_INCLUDE_DIR NAMES fmt/core.h)

if(BUILD_SHARED_LIB)
	add_library(fmtlog SHARED fmtlog.cc)
else()
	add_library(fmtlog STATIC fmtlog.cc)
endif()
target_include_directories(fmtlog PUBLIC ${FMT_INCLUDE_DIR})
target_link_libraries(fmtlog PUBLIC ${FMT})
set_target_properties(fmtlog PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS ON)

install(TARGETS fmtlog
    RUNTIME DESTINATION "bin"
    LIBRARY DESTINATION "lib"
    ARCHIVE DESTINATION "lib"
)

install(FILES "fmtlog.h" DESTINATION "${CMAKE_INSTALL_PREFIX}/include")