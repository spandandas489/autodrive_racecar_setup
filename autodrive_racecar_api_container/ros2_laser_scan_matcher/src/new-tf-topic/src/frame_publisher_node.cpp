#include <chrono>
#include <functional>
#include <memory>
#include <string>
#include <vector>
#include <cmath>

#include "rclcpp/rclcpp.hpp"
#include "geometry_msgs/msg/transform_stamped.hpp"
#include "tf2/LinearMath/Quaternion.h"
// MODIFICATION 1: Include the TFMessage header
#include "tf2_msgs/msg/tf_message.hpp"

using namespace std::chrono_literals;

class FramePublisher : public rclcpp::Node
{
public:
  FramePublisher()
  : Node("odom_frame_publisher")
  {
    tf_publisher_ =
      this->create_publisher<tf2_msgs::msg::TFMessage>("/tf", 10);

    timer_ = this->create_wall_timer(
      20ms, std::bind(&FramePublisher::broadcast_timer_callback, this));

    RCLCPP_INFO(this->get_logger(), "Started publishing world -> odom -> roboracer_1 transforms on /tf_new topic.");
  }

private:
  void broadcast_timer_callback()
  {
    rclcpp::Time now = this->get_clock()->now();
    geometry_msgs::msg::TransformStamped world_to_odom_transform;
    world_to_odom_transform.header.stamp = now;
    world_to_odom_transform.header.frame_id = "world";
    world_to_odom_transform.child_frame_id = "odom";
    world_to_odom_transform.transform.translation.x = 0.0;
    world_to_odom_transform.transform.translation.y = 0.0;
    world_to_odom_transform.transform.translation.z = 0.0;
    world_to_odom_transform.transform.rotation.w = 1.0;

    // geometry_msgs::msg::TransformStamped odom_to_robot_transform;
    // odom_to_robot_transform.header.stamp = now;
    // odom_to_robot_transform.header.frame_id = "odom";
    // odom_to_robot_transform.child_frame_id = "roboracer_1";
    // odom_to_robot_transform.transform.translation.x = 0.0;
    // odom_to_robot_transform.transform.translation.y = 0.0;
    // odom_to_robot_transform.transform.translation.z = 0.0;
    // odom_to_robot_transform.transform.rotation.w = 1.0;

    // Simulate motion


    // MODIFICATION 3: Publish the transforms in a TFMessage
    tf2_msgs::msg::TFMessage tf_msg;
    tf_msg.transforms.push_back(world_to_odom_transform);
    // tf_msg.transforms.push_back(odom_to_robot_transform);
    tf_publisher_->publish(tf_msg);
  }

  rclcpp::TimerBase::SharedPtr timer_;
  // MODIFICATION 4: The member variable is now a publisher
  rclcpp::Publisher<tf2_msgs::msg::TFMessage>::SharedPtr tf_publisher_;
};

int main(int argc, char * argv[])
{
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<FramePublisher>());
  rclcpp::shutdown();
  return 0;
}