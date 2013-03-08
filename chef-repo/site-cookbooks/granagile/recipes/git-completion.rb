directory "/usr/share/git-core/contrib/completion" do
  user "root"
  group "root"
  mode 0755
  action :create
end

execute "install git-completion" do
  user "root"
  creates "/usr/share/git-core/contrib/completion/git-completion.bash"
  command "curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash | sudo tee /usr/share/git-core/contrib/completion/git-completion.bash"
end

execute "install git-prompt" do
  user "root"
  creates "/usr/share/git-core/contrib/completion/git-prompt.sh"
  command "https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh | sudo tee /usr/share/git-core/contrib/completion/git-prompt.sh"
end

[
  "etc/profile.d/git-completion.sh",
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
