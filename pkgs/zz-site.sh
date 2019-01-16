# This is the last package built -- add your dependencies here

export GOROOT="$VENV/opt/go"
export GOPATH="$BUILD_DIR/go"

rm -fR $GOPATH
mkdir -p $GOPATH

JUNIT_REPORT_LOCATION=github.com/jstemmer/go-junit-report
$GOROOT/bin/go get -u $JUNIT_REPORT_LOCATION
cd "${GOPATH}/src/$JUNIT_REPORT_LOCATION"
$GOROOT/bin/go build
mv go-junit-report $VENV/bin

# postgres textsearch thesaurus data
mkdir -p $VENV/share/postgresql/tsearch_data
cp $SCRIPTPATH/data/postgresql/thesaurus_direct.ths $VENV/share/postgresql/tsearch_data/
