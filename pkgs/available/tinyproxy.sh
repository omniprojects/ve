TINYPROXY_VERSION="1.10.0"
getpkg https://github.com/tinyproxy/tinyproxy/releases/download/${TINYPROXY_VERSION}/tinyproxy-${TINYPROXY_VERSION}.tar.gz
tar zxf tinyproxy-${TINYPROXY_VERSION}.tar.gz
cd tinyproxy-${TINYPROXY_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
