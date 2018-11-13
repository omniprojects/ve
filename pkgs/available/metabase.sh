METABASE_VERSION="0.31.0"

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar $BUILD_DIR/metabase-${METABASE_VERSION}.jar

mv $BUILD_DIR/metabase-${METABASE_VERSION}.jar $VENV/opt/metabase/metabase.jar
