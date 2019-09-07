# install prefix
VENV="/ove"

# cache package downloads
PKG_CACHE="/tmp/venv-pkg"

# build directory
BUILD_DIR="$VENV/build"

# remote rsync for push/pull
RSYNC_USER="ve"
RSYNC_HOST="netops.omn1.io"

SUBPATH="$(echo $BUILDKITE_BRANCH | tr '/' '-')"
if [ "$SUBPATH" == "" ]; then
SUBPATH="$(git rev-parse --abbrev-ref HEAD | tr '/' '-')"
fi

RSYNC_PATH="ve/$SUBPATH"
