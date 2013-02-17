wdir=$(cd $(dirname $0)/../..; pwd)

cd $wdir

sudo yum -y install git

sh install/git/install-git-completion.sh

sh install/git/install-git-flow.sh

if [ ! -f ~/.gitconfig ]; then
	echo "[user]
	  name = $USER
	  email = $USER@gmail.com
	[color]
	  ui = true
	[alias]
	  co = checkout
	  ci = commit
	  st = status
	  br = branch
	  hist = log --pretty=format:\\\"%h %ad | %s%d [%an]\\\" --graph --date=short
	  nffmerge  = merge --no-ff
	[core]
	  excludesfile = ~/.gitignore" > ~/.gitconfig
fi

if [ ! -d ~/.ssh ]; then mkdir -m 700 ~/.ssh; fi

if [ ! -f ~/.ssh/config ]; then
  echo "Host github.com
    User git
    Port 22
    ForwardAgent yes
    IdentityFile ~/.ssh/github.user.id_rsa" > ~/.ssh/config
  chmod 600 ~/.ssh/config
fi

