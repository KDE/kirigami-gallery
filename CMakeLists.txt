cmake_minimum_required(VERSION 3.0)

set(KF5_VERSION "5.47.0") # handled by release scripts
set(KF5_DEP_VERSION "5.47.0") # handled by release scripts

project(kirigami2gallery VERSION ${KF5_VERSION})

set(REQUIRED_QT_VERSION 5.8.0)

SET(CMAKE_CXX_STANDARD 11)

################# Disallow in-source build #################

if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
   message(FATAL_ERROR "kirigami gallery requires an out of source build. Please create a separate build directory and run 'cmake path_to_kirigami [options]' there.")
endif()

# Make CPack available to easy generate binary packages
include(CPack)
include(FeatureSummary)

find_package(Qt5 ${REQUIRED_QT_VERSION} REQUIRED NO_MODULE COMPONENTS Core Quick Gui Svg QuickControls2)

set(CMAKE_AUTOMOC ON)
set(AUTOMOC_MOC_OPTIONS -Muri=org.kde.kirigami)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

################# set KDE specific information #################

find_package(ECM 5.47.0 NO_MODULE)
set_package_properties(ECM PROPERTIES TYPE REQUIRED DESCRIPTION "Extra CMake Modules." URL "https://projects.kde.org/projects/kdesupport/extra-cmake-modules")

# where to look first for cmake modules, before ${CMAKE_ROOT}/Modules/ is checked
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

include(GenerateExportHeader)
include(ECMSetupVersion)
include(ECMGenerateHeaders)
include(CMakePackageConfigHelpers)
include(ECMPoQmTools)
include(ECMQMLModules)
include(KDEInstallDirs)
include(KDECMakeSettings)
include(ECMQtDeclareLoggingCategory)
include(ECMAddQch)
include(KDECompilerSettings NO_POLICY_SCOPE)

set(CMAKECONFIG_INSTALL_DIR "${KDE_INSTALL_CMAKEPACKAGEDIR}/KF5Kirigami2")

if(CMAKE_SYSTEM_NAME STREQUAL "Android")
    find_package(Qt5AndroidExtras ${REQUIRED_QT_VERSION} REQUIRED)
endif()


ecm_find_qmlmodule(QtGraphicalEffects 1.0)

add_definitions(-DQT_NO_URL_CAST_FROM_STRING)

add_subdirectory(src)

if (IS_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/po")
    ecm_install_po_files_as_qm(po)
endif()

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)

