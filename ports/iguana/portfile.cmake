vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO qicosmos/iguana
    REF 1.0.5 # latest
    SHA512 5B26C49C94F94AF73F092746BD7FCE578083AC24F360138C541C3620802EAF4DDF0497369188F86664434D2AE3F9B99A88FE23FC30D0CFE79CA9DD7D91848A35
    HEAD_REF master
)

file(INSTALL "${SOURCE_PATH}/iguana" DESTINATION "${CURRENT_PACKAGES_DIR}/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")