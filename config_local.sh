# install prefix
VENV="/ove"

# cache package downloads
PKG_CACHE="/tmp/venv-pkg"

# build directory
BUILD_DIR="$VENV/build"

# remote rsync for push/pull
RSYNC_USER="ve"
RSYNC_HOST="netops.omn1.io"

SUBPATH="$(git rev-parse --abbrev-ref HEAD | tr '/' '-')"
RSYNC_PATH="ve/$SUBPATH"
