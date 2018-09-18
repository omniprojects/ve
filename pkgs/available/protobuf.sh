PROTOBUF_VERSION="3.5.1"

cd $BUILD_DIR
rm -fR protobuf* v${PROTOBUF_VERSION}.tar.gz
getpkg https://github.com/protocolbuffers/protobuf/archive/v${PROTOBUF_VERSION}.tar.gz
tar zxf v${PROTOBUF_VERSION}.tar.gz
cd protobuf-${PROTOBUF_VERSION}
./autogen.sh
./configure --prefix=$VENV
$PMAKE
make install

cd $BUILD_DIR

# golang
export GOROOT="$VENV/opt/go"
export GOPATH="$BUILD_DIR/go"
mkdir -p $GOPATH
GEN_GO_LOCATION=github.com/golang/protobuf/protoc-gen-go
$VENV/opt/go/bin/go get -u $GEN_GO_LOCATION
cd "${GOPATH}/src/$GEN_GO_LOCATION"
$VENV/opt/go/bin/go build
mv protoc-gen-go $VENV/bin
