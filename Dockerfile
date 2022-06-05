FROM osrf/ros:noetic-desktop-full

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y lsb-core g++ git

RUN rm /etc/ros/rosdep/sources.list.d/20-default.list && rosdep init && rosdep update

RUN apt install ros-noetic-moveit -y

RUN apt install ros-noetic-ros-controllers* -y

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /catkin_ws

COPY src ./src

RUN apt-get update \
  && rosdep update \
  && rosdep install --from-paths src -iy \
  && apt-get install ros-kinetic-catkin python-catkin-tools \
  && rm -rf /var/lib/apt/lists/* 

RUN catkin config --extend /opt/ros/noetic && catkin build --no-status

# Automatically source the workspace when starting a bash session
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc
