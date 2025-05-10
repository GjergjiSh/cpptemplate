include(FetchContent)
FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/refs/tags/v1.13.0.zip
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)
FetchContent_MakeAvailable(googletest)

enable_testing()

add_executable(x_test
    x_test.cpp
)

target_link_libraries(x_test PRIVATE x_lib gtest gtest_main)

include(GoogleTest)
gtest_discover_tests(x_test)