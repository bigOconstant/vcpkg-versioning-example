# CMakeLists.txt
cmake_minimum_required(VERSION 3.14)
project(post)

include(./vcpkg/scripts/buildsystems/vcpkg.cmake)

find_package(cpr CONFIG REQUIRED)
find_package(RapidJSON CONFIG REQUIRED)

file(GLOB SOURCES  
     ./apps/main.cpp
)

list(APPEND includePath ${RAPIDJSON_INCLUDE_DIRS})


add_executable(post ${SOURCES} )

target_include_directories(post PUBLIC ${includePath}  )

target_link_libraries(post PRIVATE cpr)
