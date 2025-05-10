include(FetchContent)
FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/refs/tags/v1.13.0.zip
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)
FetchContent_MakeAvailable(googletest)

enable_testing()

add_executable(a2lwriter_tests
    a2lwriter_tests.cpp
)

target_link_libraries(a2lwriter_tests PRIVATE a2lwriter gtest gtest_main)

include(GoogleTest)
gtest_discover_tests(a2lwriter_tests)