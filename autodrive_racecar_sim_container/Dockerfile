FROM autodriveecosystem/autodrive_roboracer_sim:2025-icra-practice


# Make entrypoint script executable
COPY ./entrypoint.bash /entrypoint.bash
RUN chmod +x /entrypoint.bash

ENTRYPOINT ["/entrypoint.bash"]

