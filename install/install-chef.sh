wdir=$(cd $(dirname $0)/..; pwd)

cd $wdir
sudo sh install/install-ruby-1.9.3-rpm.sh
if [ $? != 0 ]; then exit 1; fi

sudo sh install/install-rubygems-1.3.6.sh
if [ $? != 0 ]; then exit 1; fi

sudo gem install chef
if [ $? != 0 ]; then exit 1; fi
