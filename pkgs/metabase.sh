METABASE_VERSION="0.31.0"

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

mv metabase.jar $VENV/opt/metabase/
