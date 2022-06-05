#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/hn-on-fire/MRM_ERC/erc_ws/src/fiducials/aruco_detect"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/hn-on-fire/MRM_ERC/erc_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/hn-on-fire/MRM_ERC/erc_ws/install/lib/python3/dist-packages:/home/hn-on-fire/MRM_ERC/erc_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/hn-on-fire/MRM_ERC/erc_ws/build" \
    "/usr/bin/python3" \
    "/home/hn-on-fire/MRM_ERC/erc_ws/src/fiducials/aruco_detect/setup.py" \
     \
    build --build-base "/home/hn-on-fire/MRM_ERC/erc_ws/build/fiducials/aruco_detect" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/hn-on-fire/MRM_ERC/erc_ws/install" --install-scripts="/home/hn-on-fire/MRM_ERC/erc_ws/install/bin"
