# Instructions:
1. Clone the repo using
```

$ git clone https://github.com/AnshumaanMishra/autodrive_racecar_setup

```
3. Navigate into the folder:
```

$ cd autodrive_racecar_setup/autodrive_racecar_api_container

```
5. Run `start.sh`. If you are using a non-POSIX shell like FISH, you may have problems. If you do, switch to bash
```

$ bash
$ ./start.sh

```
4. In another terminal, run:
```

$ docker exec -it roboracer_dev bash

```
Make sure to run this after you get a "Building Complete" message (only for first-time setup)


Now do: 
```

cd ros2_laser_scan_matcher/src/csm/build`
make install
cd ../..
cd new-tf-topic
colcon build --symlink-install
source ./install/setup.bash
cd ../..
cd ydlidar_ros2_ws/src/YDLidar-SDK/build
make install
cd ../../ydlidar_ros2_driver
colcon build --symlink-install
source ./install/setup.bash
cd ../../../..
colcon build --symlink-install
source ./install/setup.bash

```

Now in 4 different terminals(inside the container):
```

cd ros2_laser_scan_matcher
ros2 bag play ./rosbag2_2025_08_29-01_58_52_0.db3 --remap /scan:=/autodrive/roboracer_1/lidar -l

```
```

ros2 run new-tf-topic frame_publisher_node

```
```

ros2 run ros2_laser_scan_matcher laser_scan_matcher

```
```

ros2 launch ydlidar_ros2_driver ydlidar_launch_view.py

```

