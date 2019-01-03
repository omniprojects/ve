METABASE_VERSION="0.31.2"

rm -fR $VENV/opt/metabase
mkdir -p $VENV/opt/metabase

getpkg http://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar

mv metabase.jar $VENV/opt/metabase/
