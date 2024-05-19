vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO zyantific/zasm
    REF e0001ae2df9ca8be73430a8914e9ea6ffc986d40
    SHA512 f9fea2712579d5e09607c427ed165362bf5b9796d1c5fa9382c66e66d0445b1fda46e08f94129953eaa6399a2fdba75119254187e2d1d8199d9906e311d7ff0e
    HEAD_REF main
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1 -DUSE_THIS_TOO=2
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

# # Moves all .cmake files from /debug/share/zasm/ to /share/zasm/
# # See /docs/maintainers/ports/vcpkg-cmake-config/vcpkg_cmake_config_fixup.md for more details
# When you uncomment "vcpkg_cmake_config_fixup()", you need to add the following to "dependencies" vcpkg.json:
#{
#    "name": "vcpkg-cmake-config",
#    "host": true
#}
# vcpkg_cmake_config_fixup()

# Uncomment the line below if necessary to install the license file for the port
# as a file named `copyright` to the directory `${CURRENT_PACKAGES_DIR}/share/${PORT}`
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
