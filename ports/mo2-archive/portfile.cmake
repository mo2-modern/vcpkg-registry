set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPKG_POLICY_DLLS_IN_STATIC_LIBRARY enabled)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mo2-modern/modorganizer-archive
    REF "${VERSION}"
    SHA512 C9B6D5B32958B3E4F61442D913C5E69E1EF7F3E81BE1F05D5946C849344060612812F3C5E3527E397A24A7736CD7DC562BF208D3BC823C88B0AC873DA8017350
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup(PACKAGE_NAME "mo2-archive" CONFIG_PATH "lib/cmake/mo2-archive")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
