execute_process(COMMAND "/home/hn-on-fire/MRM_ERC/erc_ws/build/fiducials/aruco_detect/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/hn-on-fire/MRM_ERC/erc_ws/build/fiducials/aruco_detect/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
