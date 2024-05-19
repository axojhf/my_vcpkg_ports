vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO qicosmos/cinatra
    REF a1ca4748ad2dda521c1b045b5f2672adac3919f1 # latest
    SHA512 E68F29A65B47AFB95D6B805C8F8A637DFEC3CC871519F80243953256552057A17C9DE7C2665153E9C1126B96B8B955C056DD7E5534DF3060E294081F0974E656
    HEAD_REF master
)

file(INSTALL "${SOURCE_PATH}/include/cinatra" DESTINATION "${CURRENT_PACKAGES_DIR}/include")
file(INSTALL "${SOURCE_PATH}/include/cinatra.hpp" DESTINATION "${CURRENT_PACKAGES_DIR}/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
