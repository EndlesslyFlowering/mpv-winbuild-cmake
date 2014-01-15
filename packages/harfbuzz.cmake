ExternalProject_Add(harfbuzz
    DEPENDS freetype2 libpng
    GIT_REPOSITORY "git://anongit.freedesktop.org/harfbuzz"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --disable-shared
        --with-icu=no
        --with-glib=no
        --with-gobject=no
        --disable-gtk-doc-html
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(harfbuzz)
autogen(harfbuzz)
