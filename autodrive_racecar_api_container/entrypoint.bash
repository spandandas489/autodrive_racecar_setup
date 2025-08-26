#!/bin/bash
set -e

# Source bashrc and ROS 2 Humble
if [ -f /root/.bashrc ]; then
  source /root/.bashrc
fi
source /opt/ros/humble/setup.bash

cd /home/autodrive_devkit

# Clone ros2_laser_scan_matcher if missing
if [ ! -d "ros2_laser_scan_matcher/.git" ]; then
  echo "Cloning main Repo"
  git clone https://github.com/AlexKaravaev/ros2_laser_scan_matcher.git
fi

# Clone and build csm if missing
if [ ! -d "ros2_laser_scan_matcher/src/csm/.git" ]; then
  echo "Cloning CSM repo"
  source /opt/ros/humble/setup.bash
fi

# Build ROS 2 package only if not already installed
if [ ! -f "ros2_laser_scan_matcher/install/setup.bash" ]; then
  cd ros2_laser_scan_matcher/src
  git clone https://github.com/AlexKaravaev/csm.git
  cd csm
  mkdir -p build && cd build
  cmake ..
  make -j$(nproc)
  make install
  cd /home/autodrive_devkit
  cp /usr/local/lib/libcsm.so ./ros2_laser_scan_matcher/libcsm.so
  echo "Building Package"
  cd ros2_laser_scan_matcher
  colcon build --symlink-install --packages-select ros2_laser_scan_matcher
fi

# Drop into interactive bash
echo "Building Complete, please attach to running container using:"
echo "docker exec -it roboracer_dev bash"
exec /bin/bash -l
