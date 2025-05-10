file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
file(GLOB HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/include/*.h)

add_library(a2lwriter STATIC ${SOURCES} ${HEADERS})

target_include_directories(a2lwriter PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)