file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
file(GLOB HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/include/*.h)

add_library(x_lib STATIC ${SOURCES} ${HEADERS})

target_include_directories(x_lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)