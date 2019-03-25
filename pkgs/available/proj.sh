PROJ_VERSION="4.9.3"
getpkg http://download.osgeo.org/proj/proj-${PROJ_VERSION}.tar.gz
tar zxf proj-${PROJ_VERSION}.tar.gz
cd proj-${PROJ_VERSION}
./configure --prefix=$VENV
$PMAKE
make install
