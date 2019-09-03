PYTHON_VERSION="3.7.4"
PYTHON_MD5SUM="68111671e5b2db4aef7b9ab01bf0f9be"

getpkg https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz

if [ "$(md5sum Python-${PYTHON_VERSION}.tgz | awk '{print $1}')" != "$PYTHON_MD5SUM" ]; then
    echo "Bad release?"
    exit 1
fi

tar zxf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --prefix=$VENV --enable-shared --with-system-expat # --enable-optimizations
$PMAKE
make install

cd $BUILD_DIR

export AIRFLOW_GPL_UNIDECODE=1  # hax for airflow dep license bs

$VENV/bin/pip3 install -U pip
$VENV/bin/pip3 install -r ${SCRIPTPATH}/pkgs/available/python3-requirements.txt --src $VENV/src
