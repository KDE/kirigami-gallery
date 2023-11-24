cmake_minimum_required(VERSION 3.16)

# KDE Release Service Version, managed by release script
set (RELEASE_SERVICE_VERSION_MAJOR "24")
set (RELEASE_SERVICE_VERSION_MINOR "01")
set (RELEASE_SERVICE_VERSION_MICRO "80")
set (RELEASE_SERVICE_VERSION "${RELEASE_SERVICE_VERSION_MAJOR}.${RELEASE_SERVICE_VERSION_MINOR}.${RELEASE_SERVICE_VERSION_MICRO}")

project(kirigami2gallery VERSION ${RELEASE_SERVICE_VERSION})

set(REQUIRED_QT_VERSION "5.15.0")
if (ANDROID)
    set(REQUIRED_QT_VERSION "5.15.10")
endif()
set(KF5_DEP_VERSION "5.79.0")

set(CMAKE_CXX_STANDARD 17)

find_package(ECM ${KF5_DEP_VERSION} REQUIRED)

# where to look first for cmake modules, before ${CMAKE_ROOT}/Modules/ is checked
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH})

option(ENABLE_QML_PROFILING "Enable QML profiler support" ON)

include(FeatureSummary)
include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(ECMPoQmTools)
include(ECMQMLModules)

find_package(Qt${QT_MAJOR_VERSION} ${REQUIRED_QT_VERSION} REQUIRED NO_MODULE COMPONENTS Core Quick Gui Svg QuickControls2)

find_package(KF5 ${KF5_DEP_VERSION} REQUIRED COMPONENTS Kirigami2 ItemModels)

if(ANDROID)
    find_package(Qt5AndroidExtras ${REQUIRED_QT_VERSION} REQUIRED)
else()
    find_package(Qt${QT_MAJOR_VERSION}Widgets ${REQUIRED_QT_VERSION} REQUIRED)
endif()

ecm_find_qmlmodule(QtGraphicalEffects 1.0)
ecm_find_qmlmodule(org.kde.kitemmodels 1.0)

add_definitions(-DQT_NO_URL_CAST_FROM_STRING)

add_subdirectory(src)

ecm_install_po_files_as_qm(poqm)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)

