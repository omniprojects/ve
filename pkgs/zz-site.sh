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
cp $SCRIPTPATH/data/postgresql/en_us.dict $VENV/share/postgresql/tsearch_data/en_us.dict
cp $SCRIPTPATH/data/postgresql/en_us.affix $VENV/share/postgresql/tsearch_data/en_us.affix

# hax for broken salt - runas / cwd not working on osx
cd $VENV/lib/python3.6/site-packages/salt/modules
patch -p0 <<EOF
--- /Users/mattb/src/omni/om/cmdmod.py	2019-06-17 16:36:50.000000000 -0700
+++ cmdmod.py	2019-06-17 16:36:53.000000000 -0700
@@ -413,7 +413,7 @@
         if isinstance(cmd, (list, tuple)):
             cmd = ' '.join(map(_cmd_quote, cmd))
 
-        cmd = 'su -l {0} -c "{1}"'.format(runas, cmd)
+        cmd = 'su -l {0} -c "cd {1}; {2}"'.format(runas, cwd, cmd)
         # set runas to None, because if you try to run \`su -l\` as well as
         # simulate the environment macOS will prompt for the password of the
         # user and will cause salt to hang.
EOF
