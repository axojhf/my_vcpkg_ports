vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO MengRao/fmtlog
    REF 01b6cd339101f36c37e50938ec11918c6229b2de
    SHA512 7149b5bca3e4842bdacc43d0ab92092ea9b5c9388ee7f6dc4fda32b3495db4e51c0c1d9ce6e397575b0fa5958a9ea8f32aba282fe19e119af9278ae37fbddc3f
    HEAD_REF main
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" BUILD_SHARED_LIB)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DBUILD_SHARED_LIB=${BUILD_SHARED_LIB}
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")