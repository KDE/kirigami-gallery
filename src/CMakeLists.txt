if (ENABLE_QML_PROFILING)
    add_definitions(-DQT_QML_DEBUG)
endif()

add_executable(kirigami2gallery
    main.cpp
    InfoData.cpp
    resources.qrc)
target_link_libraries(kirigami2gallery Qt::Core Qt::Qml Qt::Quick Qt::Svg Qt::QuickControls2 KF6::Kirigami KF6::ItemModels)

if (ANDROID)
    kirigami_package_breeze_icons(ICONS applications-graphics view-list-icons folder-sync view-list-details configure document-edit dialog-information dialog-positive dialog-warning dialog-error dialog-cancel document-decrypt system-run mail-reply-sender bookmarks folder media-record-symbolic add-placemark address-book-new-symbolic view-right-new view-right-close documentinfo go-home)

    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/android/version.gradle.in ${CMAKE_BINARY_DIR}/version.gradle)
    ecm_add_android_apk(kirigami2gallery ANDROID_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android)
else()
    target_link_libraries(kirigami2gallery Qt::Widgets)
endif()

install(TARGETS kirigami2gallery ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
