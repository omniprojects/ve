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

rm -fR $GOPATH
mkdir -p $GOPATH

GEN_GO_LOCATION=github.com/golang/protobuf/protoc-gen-go
$VENV/opt/go/bin/go get -u $GEN_GO_LOCATION
cd "${GOPATH}/src/$GEN_GO_LOCATION"
$VENV/opt/go/bin/go build
mv protoc-gen-go $VENV/bin

# Install protobuf->Twirp  generator
GEN_TWIRP_LOCATION=github.com/twitchtv/twirp/protoc-gen-twirp
$VENV/opt/go/bin/go get -u $GEN_TWIRP_LOCATION
cd "${GOPATH}/src/$GEN_TWIRP_LOCATION"
$VENV/opt/go/bin/go build
mv protoc-gen-twirp $VENV/bin

# Install protobuf->Swagger  generator
GEN_SWAGGER_LOCATION=github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
$VENV/opt/go/bin/go get -u $GEN_SWAGGER_LOCATION
cd "${GOPATH}/src/$GEN_SWAGGER_LOCATION"
$VENV/opt/go/bin/go build
mv protoc-gen-swagger $VENV/bin

# Install protobuf->Validator generator
GEN_VALIDATORS_LOCATION=github.com/mwitkow/go-proto-validators/protoc-gen-govalidators
$VENV/opt/go/bin/go get -u $GEN_VALIDATORS_LOCATION
cd "${GOPATH}/src/$GEN_VALIDATORS_LOCATION"
$VENV/opt/go/bin/go build
mv protoc-gen-govalidators $VENV/bin
