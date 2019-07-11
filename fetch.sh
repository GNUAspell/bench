set -e

for f in orig cur common-filtered common-all
do (
    rm -r $f
    mkdir $f
    cd $f
    wget http://aspell.net/test/$f/data.tar.gz
    #tar xf data.tar.gz
) done
