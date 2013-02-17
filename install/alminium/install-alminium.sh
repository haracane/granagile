if [ $USER != root ]; then
  echo "user should be 'root'" >&2
  exit 1
fi

OS=$1

if [ "$OS" = "" ]; then OS=rhel6; fi

base_dir=$(cd $(dirname $0); pwd)

echo "yum -y install git" >&2
yum -y install git rpmdevtools libyaml-devel readline-devel ncurses-devel gdbm-devel tcl-devel openssl-devel db4-devel libffi-devel

srcdir=/root/src
if [ ! -d $srcdir ]; then mkdir -p $srcdir; fi
cd $srcdir

if [ ! -d alminium ]; then
  git clone https://github.com/alminium/alminium.git
  if [ $? != 0 ]; then exit 1; fi
fi

cd alminium

echo "bash $srcdir/alminium/inst-script/$OS/ruby1.9-install" >&2
bash $srcdir/alminium/inst-script/$OS/ruby1.9-install
if [ $? != 0 ]; then exit 1; fi

for cmd in rake gem; do
  if [ ! -f /usr/bin/${cmd}1.9.3 ]; then
    echo "mv /usr/bin/${cmd} /usr/bin/${cmd}1.9.3" >&2
    mv /usr/bin/${cmd} /usr/bin/${cmd}1.9.3
    if [ $? != 0 ]; then exit 1; fi
    
    echo "ln -s /usr/bin/${cmd}1.9.3 /usr/bin/${cmd}" >&2
    ln -s /usr/bin/${cmd}1.9.3 /usr/bin/${cmd}
    if [ $? != 0 ]; then exit 1; fi
  fi
done

if [ ! -d cache ]; then mkdir cache; fi
cd cache
tarball=redmine-2.0.3.tar.gz
if [ ! -f $tarball ]; then
  echo "curl -L -O http://rubyforge.org/frs/download.php/76259/redmine-2.0.3.tar.gz" >&2
  curl -L -O http://rubyforge.org/frs/download.php/76259/redmine-2.0.3.tar.gz
  if [ $? != 0 ]; then exit 1; fi
fi

cd ..
echo "bash ./smelt" >&2
bash ./smelt

if [ ! -d /usr/lib64 ]; then
  echo 'sed "s/lib64/lib/g" -i /etc/httpd/conf.d/redmine.conf' >&2
  sed "s/lib64/lib/g" -i /etc/httpd/conf.d/redmine.conf
  if [ $? != 0 ]; then exit 1; fi
fi

echo "cp $base_dir/files/opt/alminium/config/scm.yml /opt/alminium/config/scm.yml" >&2
cp $base_dir/files/opt/alminium/config/scm.yml /opt/alminium/config/scm.yml
if [ $? != 0 ]; then exit 1; fi
