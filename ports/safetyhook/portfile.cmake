vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO cursey/safetyhook
    REF b046e123dc69821f2c375161e0adef3c6d9c9db4
    SHA512 865D62F94C3E13CBD763148A30168B58FB582BA40C543362C6556CD5A32CEA16B0B6B5DDA29B1EF2260D6FBF2B468E01D97A4F3F59121DA5FD297BECF602B7F4
    HEAD_REF main
)


file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    # OPTIONS
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
