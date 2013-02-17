curl https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh | sudo sh
if [ $? != 0 ]; then exit 1; fi

curl https://raw.github.com/bobthecow/git-flow-completion/master/git-flow-completion.bash | sudo tee /usr/share/git-core/contrib/completion/git-flow-completion.bash
if [ $? != 0 ]; then exit 1; fi

echo "source /usr/share/git-core/contrib/completion/git-flow-completion.bash" | sudo tee /etc/profile.d/git-flow-completion.sh

source /etc/profile.d/git-flow-completion.sh

