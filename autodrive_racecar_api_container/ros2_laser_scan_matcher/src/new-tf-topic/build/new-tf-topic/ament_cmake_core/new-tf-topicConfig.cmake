# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_new-tf-topic_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED new-tf-topic_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(new-tf-topic_FOUND FALSE)
  elseif(NOT new-tf-topic_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(new-tf-topic_FOUND FALSE)
  endif()
  return()
endif()
set(_new-tf-topic_CONFIG_INCLUDED TRUE)

# output package information
if(NOT new-tf-topic_FIND_QUIETLY)
  message(STATUS "Found new-tf-topic: 0.0.0 (${new-tf-topic_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'new-tf-topic' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${new-tf-topic_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(new-tf-topic_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${new-tf-topic_DIR}/${_extra}")
endforeach()
