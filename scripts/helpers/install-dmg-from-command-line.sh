#!/bin/sh 

# from: https://coderwall.com/p/ftrahg/install-all-the-dmg-s
function install_from_dmg () {
    URL="${1}"
    MOUNT="${2}"

    pushd /tmp > /dev/null

    echo "Downloading ${URL}"
    curl -L "${URL}" -o app.dmg

    MOUNT_PATH="/Volumes/${MOUNT}"

    echo "Mounting ${MOUNT_PATH}"
    hdiutil mount app.dmg

    MPKG_PATH="$(find "${MOUNT_PATH}" -name "*.mpkg" 2> /dev/null || echo "")"
    PKG_PATH="$(find "${MOUNT_PATH}" -name "*.pkg" 2> /dev/null || echo "")"
    APP_PATH="$(find "${MOUNT_PATH}" -name "*.app" 2> /dev/null || echo "")"
    APP_NAME="$(ls "${MOUNT_PATH}" | grep ".app$" || echo "")"

    if
        [ "${APP_PATH}" != "" ]
    then
        echo "Rsync app to /Applications/${APP_NAME}"
        sudo rsync -av "${APP_PATH}/" "/Applications/${APP_NAME}/"
    elif
        [ "${MPKG_PATH}" != "" ]
    then
        install_from_pkg "${MPKG_PATH}"
    elif
        [ "${PKG_PATH}" != "" ]
    then
        install_from_pkg "${PKG_PATH}"
    else
        abort "No app or pkg found for ${MOUNT}"
    fi

    sleep 10

    echo "Unmounting ${MOUNT_PATH}"
    hdiutil unmount "${MOUNT_PATH}"

    echo "Removing DMG"
    rm -rf app.dmg

    popd > /dev/null
}

function install_from_pkg () {
    echo "Install package ${1}"
    sudo installer -package "${1}" -target "/"
}

install_from_dmg $1 $2