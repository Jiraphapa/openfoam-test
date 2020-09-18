username="$USER"
user="$(id -u)"
home="${1:-$HOME}"

imageName="openfoamplus/of_v2006_centos73"
containerName="of_v2006"   
displayVar="$DISPLAY"


docker run --user=${user}   \
    -e USER=${username}                                     \
    -e QT_X11_NO_MITSHM=1                                   \
    -e DISPLAY=${displayVar}                                \
    -e QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb                \
    --workdir="${home}"                                     \
    --volume="${home}:${home}"                              \
    --volume="/etc/group:/etc/group:ro"                     \
    --volume="/etc/passwd:/etc/passwd:ro"                   \
    --volume="/etc/shadow:/etc/shadow:ro"                   \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro"             \
     -v=/tmp/.X11-unix:/tmp/.X11-unix ${imageName}          \
     /bin/bash --rcfile /opt/OpenFOAM/setImage_v2006.sh -c "ls -R"
