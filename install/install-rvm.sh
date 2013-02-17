sudo yum install -y git zlib-devel httpd httpd-devel openssl-devel libyaml-devel libxml2-devel libxslt-devel libffi-devel readline-devel pcre-devel iconv-devel sqlite-devel curl-devel nkf
if [ $? != 0 ]; then exit 1; fi

cd ~/
echo "bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)" | bash
if [ $? != 0 ]; then exit 1; fi

echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*' >> ~/.bash_profile

if [ ! -e ~/.gemrc ]; then
  echo "gem: --no-ri --no-rdoc" > ~/.gemrc
fi

source ~/.bash_profile

