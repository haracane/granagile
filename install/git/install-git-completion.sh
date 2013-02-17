sudo mkdir -p /usr/share/git-core/contrib/completion
if [ $? != 0 ]; then exit 1; fi

curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash | sudo tee /usr/share/git-core/contrib/completion/git-completion.bash
if [ $? != 0 ]; then exit 1; fi

curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh | sudo tee /usr/share/git-core/contrib/completion/git-prompt.sh
if [ $? != 0 ]; then exit 1; fi

echo "source /usr/share/git-core/contrib/completion/git-completion.bash
source /usr/share/git-core/contrib/completion/git-prompt.sh
export PS1='[\[\033[32m\]\u@\h\[\033[00m\] \[\033[34m\]\W\[\033[00m\]]\[\033[31m\]\$(__git_ps1)\[\033[00m\]\\$ '" | sudo tee /etc/profile.d/git-completion.sh

source /etc/profile.d/git-completion.sh

