cmake_minimum_required(VERSION 3.13.4)
project(SWAR_pass)

#===============================================================================
# 1. LOAD LLVM CONFIGURATION
#===============================================================================
# Set this to a valid LLVM installation dir
set(LT_LLVM_INSTALL_DIR "" CACHE PATH "LLVM installation directory")

# Set Compiler FLAGS for haswell IS
SET(GCC_COVERAGE_COMPILE_FLAGS "-mbmi2")

# Add the location of LLVMConfig.cmake to CMake search paths (so that
# find_package can locate it)
list(APPEND CMAKE_PREFIX_PATH "${LT_LLVM_INSTALL_DIR}/lib/cmake/llvm/")

# FIXME: This is a warkaround for #25. Remove once resolved and use
# find_package(LLVM 11.0.0 REQUIERED CONFIG) instead.
find_package(LLVM REQUIRED CONFIG)

# HelloWorld includes headers from LLVM - update the include paths accordingly
include_directories(SYSTEM ${LLVM_INCLUDE_DIRS})

#===============================================================================
# 2. BUILD CONFIGURATION
#===============================================================================
# Use the same C++ standard as LLVM does
set(CMAKE_CXX_STANDARD 14 CACHE STRING "")
SET(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}")

# LLVM is normally built without RTTI. Be consistent with that.
if(NOT LLVM_ENABLE_RTTI)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")
endif()

#===============================================================================
# 3. ADD THE TARGET
#===============================================================================
add_library(
  SWARPass
  SHARED
  lib/SWARPass.cpp
  lib/SWARBinary.cpp
  lib/SWARHorizontal.cpp
)

    # Configure include directories for 'plugin'
target_include_directories(
  SWARPass
  PRIVATE
  include
)

# add_library(SWARPass SHARED SWARPass.cpp)

# Allow undefined symbols in shared objects on Darwin (this is the default
# behaviour on Linux)
target_link_libraries(SWARPass
  "$<$<PLATFORM_ID:Darwin>:-undefined dynamic_lookup>")
