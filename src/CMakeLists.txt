if (ENABLE_QML_PROFILING)
    add_definitions(-DQT_QML_DEBUG)
endif()

find_program(kpackagetool_cmd kpackagetool5)
if (kpackagetool_cmd)
    set(component org.kde.kirigami2.gallery)
    set(APPDATAFILE "${CMAKE_CURRENT_BINARY_DIR}/${component}.appdata.xml")

    message(STATUS "${kpackagetool_cmd} --appstream-metainfo ${CMAKE_CURRENT_SOURCE_DIR}/data --appstream-metainfo-output ${APPDATAFILE}")
    execute_process(
        COMMAND ${kpackagetool_cmd} --appstream-metainfo ${CMAKE_CURRENT_SOURCE_DIR}/data --appstream-metainfo-output ${APPDATAFILE}
        ERROR_VARIABLE appstreamerror
        RESULT_VARIABLE result)
    if (NOT result EQUAL 0)
        message(WARNING "couldn't generate metainfo for ${component}: ${appstreamerror}")
    else()
        if(appstreamerror)
            message(WARNING "warnings during generation of metainfo for ${component}: ${appstreamerror}")
        endif()

        # OPTIONAL because desktop files can be NoDisplay so they render no XML.
        install(FILES ${APPDATAFILE} DESTINATION ${KDE_INSTALL_METAINFODIR} OPTIONAL)
    endif()
else()
    message(WARNING "KPackage components should be specified in reverse domain notation. Appstream information won't be generated for ${component}.")
endif()

add_executable(kirigami2gallery
    main.cpp
    InfoData.cpp
    resources.qrc)
target_link_libraries(kirigami2gallery
    Qt${QT_MAJOR_VERSION}::Core
    Qt${QT_MAJOR_VERSION}::Qml
    Qt${QT_MAJOR_VERSION}::Quick
    Qt${QT_MAJOR_VERSION}::Svg
    Qt${QT_MAJOR_VERSION}::QuickControls2
    KF6::Kirigami2
    KF6::ItemModels
)

if (ANDROID)
    kirigami_package_breeze_icons(ICONS
        applications-graphics
        view-list-icons
        folder-sync
        view-list-details
        configure
        document-edit
        dialog-information
        dialog-positive
        dialog-warning
        dialog-error
        dialog-cancel
        document-decrypt
        system-run
        mail-reply-sender
        bookmarks
        folder
        media-record-symbolic
        add-placemark
        address-book-new-symbolic
        view-right-new
        view-right-close
        documentinfo
        go-home
    )

    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/android/version.gradle.in ${CMAKE_BINARY_DIR}/version.gradle)
else()
    target_link_libraries(kirigami2gallery
        Qt${QT_MAJOR_VERSION}::Widgets
    )
endif()

install(TARGETS kirigami2gallery ${KDE_INSTALL_TARGETS_DEFAULT_ARGS})
install(FILES data/metadata.desktop DESTINATION ${KDE_INSTALL_APPDIR} RENAME org.kde.kirigami2.gallery.desktop)
