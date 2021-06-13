# CMakeLists.txt
cmake_minimum_required(VERSION 3.14)
set (CMAKE_CXX_STANDARD 17)

project(consumer)

include(./vcpkg/scripts/buildsystems/vcpkg.cmake)

find_package(RdKafka CONFIG REQUIRED)
find_package(cpr CONFIG REQUIRED)
find_package(RapidJSON CONFIG REQUIRED)

file(GLOB SOURCES  
     ./apps/main.cpp
)

list(APPEND includePath "include/modern-cpp-kafka/include" ${RAPIDJSON_INCLUDE_DIRS})


add_executable(consumer ${SOURCES} )

target_include_directories(consumer PUBLIC ${includePath}  )

target_link_libraries(consumer PUBLIC optimized cpr RdKafka::rdkafka optimized RdKafka::rdkafka++ )
