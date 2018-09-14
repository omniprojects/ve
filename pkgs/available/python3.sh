PYTHON_VERSION="3.6.6"

getpkg http://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --prefix=$VENV --enable-shared --with-system-expat # --enable-optimizations
$PMAKE
make install

cd $BUILD_DIR

export AIRFLOW_GPL_UNIDECODE=1  # hax for airflow dep license bs

$VENV/bin/pip3 install -U pip
$VENV/bin/pip3 install -r ${SCRIPTPATH}/pkgs/available/python3-requirements.txt --src $VENV/src
