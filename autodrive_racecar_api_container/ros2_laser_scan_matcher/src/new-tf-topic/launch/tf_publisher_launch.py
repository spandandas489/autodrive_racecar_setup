# In cpp_tf_example/launch/tf_publisher_launch.py

from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    """
    Generates the launch description for starting the TF publisher node.
    """
    
    # Define the node to be launched
    tf_publisher_node = Node(
        package='new-tf-topic',      # The name of your package
        executable='frame_publisher_node', # The name of the executable C++ node
        name='odom_frame_publisher',   # A custom name for the node when it runs
        output='screen',               # Shows node output (like RCLCPP_INFO) in the terminal
        emulate_tty=True,              # Ensures colorized output works correctly
    )
    
    # Return the LaunchDescription object, which contains all nodes to be launched
    return LaunchDescription([
        tf_publisher_node
    ])

