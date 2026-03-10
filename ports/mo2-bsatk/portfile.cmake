vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mo2-modern/modorganizer-bsatk
    REF "${VERSION}"
    SHA512 FB0C8497FC17B9623D841195541883EEC7D58FC7826BE60233A5D451E83DA802D912127CE4A2205C7756581FB844DFB10E7EAAF2A8B2857867B2BE4020D0EB1B
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-bsatk" CONFIG_PATH "lib/cmake/mo2-bsatk")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
