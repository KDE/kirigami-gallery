cmake_minimum_required(VERSION 3.16)

# KDE Release Service Version, managed by release script
set (RELEASE_SERVICE_VERSION_MAJOR "23")
set (RELEASE_SERVICE_VERSION_MINOR "03")
set (RELEASE_SERVICE_VERSION_MICRO "70")
set (RELEASE_SERVICE_VERSION "${RELEASE_SERVICE_VERSION_MAJOR}.${RELEASE_SERVICE_VERSION_MINOR}.${RELEASE_SERVICE_VERSION_MICRO}")

project(kirigami2gallery VERSION ${RELEASE_SERVICE_VERSION})

set(REQUIRED_QT_VERSION "6.4.0")
set(QT_MAJOR_VERSION 6)

set(KF_VERSION "5.240.0") # handled by release scripts
set(KF_DEP_VERSION "5.240.0") # handled by release scripts

set(CMAKE_CXX_STANDARD 17)

find_package(ECM ${KF_DEP_VERSION} REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH})

option(ENABLE_QML_PROFILING "Enable QML profiler support" ON)

include(FeatureSummary)
include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(ECMPoQmTools)
include(ECMFindQmlModule)

find_package(Qt6Core           ${REQUIRED_QT_VERSION} REQUIRED NO_MODULE)
find_package(Qt6Quick          ${REQUIRED_QT_VERSION} REQUIRED NO_MODULE)
find_package(Qt6Gui            ${REQUIRED_QT_VERSION} REQUIRED NO_MODULE)
find_package(Qt6Svg            ${REQUIRED_QT_VERSION} REQUIRED NO_MODULE)
find_package(Qt6QuickControls2 ${REQUIRED_QT_VERSION} REQUIRED NO_MODULE)

find_package(KF6Kirigami2 ${KF_DEP_VERSION} REQUIRED)
find_package(KF6ItemModels ${KF_DEP_VERSION} REQUIRED)

if(NOT ANDROID)
    find_package(Qt${QT_MAJOR_VERSION}Widgets ${REQUIRED_QT_VERSION} REQUIRED)
endif()

ecm_find_qmlmodule(QtGraphicalEffects 1.0)
ecm_find_qmlmodule(org.kde.kitemmodels 1.0)

add_definitions(-DQT_NO_URL_CAST_FROM_STRING)

add_subdirectory(src)

ecm_install_po_files_as_qm(poqm)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)

