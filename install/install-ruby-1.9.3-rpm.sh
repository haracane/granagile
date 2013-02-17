#!/bin/sh

CHKRUBY=`rpm -qa|grep ruby-1.9`

if [ "$CHKRUBY" = "" ]
then
  pushd .

  rpmdev-setuptree

  cd ~/rpmbuild/SPECS
  wget https://raw.github.com/imeyer/ruby-1.9.3-rpm/master/ruby19.spec

  MINORVER=`grep "%define rubyminorver" ruby19.spec | awk '{print $3}'`

  cd ~/rpmbuild/SOURCES
  wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-${MINORVER}.tar.gz

  cd ~/rpmbuild/SPECS
  rpmbuild -bb ruby19.spec
  ARCH=`uname -m`
  rpm -Uvh ~/rpmbuild/RPMS/${ARCH}/ruby-1.9.3*.rpm

  popd
fi
