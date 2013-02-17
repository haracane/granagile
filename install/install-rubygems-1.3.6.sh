srcdir=~/src
if [ ! -d $srcdir ]; then mkdir -p $srcdir; fi
cd $srcdir

if [ ! -e /usr/bin/gem ]; then
  wget http://rubyforge.org/frs/download.php/69365/rubygems-1.3.6.tgz
  tar xvfz rubygems-1.3.6.tgz 
  cd rubygems-1.3.6
  ruby setup.rb 
fi

if [ ! -e /root/.gemrc ]; then
  echo "gem: --no-ri --no-rdoc" > /root/.gemrc
fi
