FROM autodriveecosystem/autodrive_roboracer_api:2025-icra-practice

# Copy custom bashrc
COPY ./.bashrc /root/.bashrc
RUN if [ -f ./ros2_laser_scan_matcher/libcsm.so ]; then \
      cp ./ros2_laser_scan_matcher/libcsm.so /usr/local/lib/libcsm.so; \
    fi

# Copy entrypoint script into image
COPY ./entrypoint.bash /entrypoint.bash
RUN chmod +x /entrypoint.bash

# Default entrypoint goes through entrypoint.bash
ENTRYPOINT ["/entrypoint.bash"]
CMD ["bash", "-l"]

