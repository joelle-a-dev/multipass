set(VCPKG_TARGET_ARCHITECTURE s390x)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_CMAKE_SYSTEM_NAME Linux)
set(VCPKG_BUILD_TYPE release)

# Workaround for dbus and qtbase: when vcpkg sets VCPKG_CMAKE_SYSTEM_NAME, CMake may treat
# native s390x builds as cross-compiling.
set(VCPKG_CMAKE_CONFIGURE_OPTIONS "-DCMAKE_CROSSCOMPILING:BOOL=OFF")

# Valgrind does not compile without errors with newer version of clang. Valgrind is compiled
# as a transitive dependency of glib and QEMU. Note that this will disable Valgrind whenever
# its linked by meson.
list(APPEND VCPKG_MESON_CONFIGURE_OPTIONS "-Dvalgrind=disabled")
