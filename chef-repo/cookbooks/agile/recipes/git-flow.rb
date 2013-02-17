execute "install git-flow" do
  user "root"
  creates "/usr/local/bin/git-flow"
  command "curl https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh | sh"
end

execute "install git-flow-completion" do
  user "root"
  creates "/usr/share/git-core/contrib/completion/git-flow-completion.bash"
  command "curl https://raw.github.com/bobthecow/git-flow-completion/master/git-flow-completion.bash | sudo tee /usr/share/git-core/contrib/completion/git-flow-completion.bash"
end  

[
  "etc/profile.d/git-flow-completion.sh",
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0644"
  end
end
