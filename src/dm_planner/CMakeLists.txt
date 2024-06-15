cmake_minimum_required(VERSION 3.0)
project(jps3d)

ADD_COMPILE_OPTIONS(-std=c++14 )

IF(NOT CMAKE_BUILD_TYPE)
  SET(CMAKE_BUILD_TYPE RelWithDebInfo)
ENDIF()

set(BUILD_SHARED_LIBS ON)

# 关闭警告
ADD_COMPILE_OPTIONS(-Wno-deprecated-declarations)
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  nav_msgs
  roscpp
  rospy
  sensor_msgs
  std_msgs
  std_srvs
  tf
  tf2
  tf2_geometry_msgs
  tf2_ros
  visualization_msgs

  )
FIND_PACKAGE(Eigen3 REQUIRED)
FIND_PACKAGE(PkgConfig REQUIRED)
PKG_CHECK_MODULES(YAMLCPP REQUIRED yaml-cpp)

IF(YAMLCPP_FOUND)
  MESSAGE(STATUS "Found yaml-cpp.")
ELSE()
  MESSAGE(FATAL_ERROR "Could not find yaml-cpp.")
ENDIF()

catkin_package(
 INCLUDE_DIRS include
 LIBRARIES
 CATKIN_DEPENDS geometry_msgs nav_msgs roscpp
 rospy
 sensor_msgs
 std_msgs
 std_srvs
 tf
 tf2
 tf2_geometry_msgs
 tf2_ros
 visualization_msgs
)


add_library(jps_lib src/jps_planner/graph_search.cpp
  src/jps_planner/jps_planner.cpp)

add_library(dmp_lib src/distance_map_planner/graph_search.cpp
  src/distance_map_planner/distance_map_planner.cpp)


include_directories(
      include
      SYSTEM
      ${catkin_INCLUDE_DIRS} ${PROJECT_SOURCE_DIR}/include
      ${EIGEN3_INCLUDE_DIR}

)

add_executable(test_distance_map_planner_2d test/test_distance_map_planner_2d.cpp test/pid_tracker.cpp)
target_link_libraries(test_distance_map_planner_2d jps_lib dmp_lib ${YAMLCPP_LIBRARIES} ${Boost_LIBRARIES}   ${catkin_LIBRARIES}
)
add_test(test_distance_map_planner_2d test_distance_map_planner_2d ${CMAKE_SOURCE_DIR}/data/corridor.yaml)


install(FILES "${PROJECT_NAME}Config.cmake" "${PROJECT_NAME}ConfigVersion.cmake"
  DESTINATION "share/${PROJECT_NAME}/cmake")

install(TARGETS jps_lib dmp_lib
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib)

install(DIRECTORY include/jps_basis include/jps_planner include/jps_collision
  DESTINATION include)
