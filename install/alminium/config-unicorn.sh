wdir=$(cd $(dirname $0); pwd)

echo sudo gem install unicorn >&2
sudo gem install unicorn
if [ $? != 0 ];then exit 1; fi

echo sudo usermod -s /bin/bash apache >&2
sudo usermod -s /bin/bash apache
if [ $? != 0 ];then exit 1; fi

echo sudo cp $wdir/unicorn/config.ru /opt/alminium/ >&2
sudo cp $wdir/unicorn/config.ru /opt/alminium/
if [ $? != 0 ];then exit 1; fi

echo sudo cp $wdir/unicorn/config/unicorn.rb /opt/alminium/config/ >&2
sudo cp $wdir/unicorn/config/unicorn.rb /opt/alminium/config/
if [ $? != 0 ];then exit 1; fi

if [ ! -d /opt/alminium/pids ]; then
  sudo mkdir /opt/alminium/pids
  if [ $? != 0 ];then exit 1; fi
  sudo chmod 777 /opt/alminium/pids
  if [ $? != 0 ];then exit 1; fi
fi

echo sudo chown -R apache:apache /opt/alminium >&2
sudo chown -R apache:apache /opt/alminium
if [ $? != 0 ];then exit 1; fi

echo sudo cp $wdir/unicorn/start-script/unicorn-alminium /etc/init.d/ >&2
sudo cp $wdir/unicorn/start-script/unicorn-alminium /etc/init.d/
if [ $? != 0 ];then exit 1; fi
