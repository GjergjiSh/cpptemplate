#!/bin/bash

LIB_NAME=""

echo "Enter the name of the template library:";
read LIB_NAME;

if [ -z "$LIB_NAME" ]; then
    echo "Error: Library name cannot be empty."
    exit 1
fi

CURRENT_DIR=$(pwd)

echo "Generating files..."

LIB_INCLUDE_FILE="${CURRENT_DIR}/lib/include/${LIB_NAME}.h"
LIB_SRC_FILE="${CURRENT_DIR}/lib/src/${LIB_NAME}.cpp"
echo "  - ${LIB_INCLUDE_FILE}"
echo "  - ${LIB_SRC_FILE}"
install -D /dev/null "$LIB_INCLUDE_FILE"
install -D /dev/null "$LIB_SRC_FILE"

TEST_SRC_FILE="${CURRENT_DIR}/tests/${LIB_NAME}_tests.cpp"
echo "  - ${TEST_SRC_FILE}"
install -D /dev/null "$TEST_SRC_FILE"

echo "Updating CMakeLists.txt files..."

ROOT_CMAKE="${CURRENT_DIR}/CMakeLists.txt"
LIB_CMAKE="${CURRENT_DIR}/lib/CMakeLists.txt"
TESTS_CMAKE="${CURRENT_DIR}/tests/CMakeLists.txt"
MAIN_CMAKE="${CURRENT_DIR}/main/CMakeLists.txt"

update_cmake_file() {
    local file_path="$1"
    local old_name="$2"
    local new_name="$3"

    if [ ! -f "$file_path" ]; then
        echo "Warning: ${file_path} not found. Skipping update for '${old_name}'."
        return 1
    fi

    echo "Updating '${old_name}' to '${new_name}' in ${file_path}..."
    if sed -i "s/${old_name}/${new_name}/g" "$file_path"; then
      echo "Update complete."
    else
      echo "Error updating file. Check sed command and file permissions."
      return 1
    fi
    return 0
}

update_cmake_file "$ROOT_CMAKE" "x_project" "${LIB_NAME}"

update_cmake_file "$LIB_CMAKE" "x_lib" "${LIB_NAME}"

update_cmake_file "$TESTS_CMAKE" "x_test" "${LIB_NAME}_tests"

update_cmake_file "$TESTS_CMAKE" "x_lib" "${LIB_NAME}"

update_cmake_file "$MAIN_CMAKE" "x_lib" "${LIB_NAME}"

echo "Setup script finished."