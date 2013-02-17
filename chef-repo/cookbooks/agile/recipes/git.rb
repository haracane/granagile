package "git" do
  action :install
end

user "git" do
  shell "/bin/bash"
end

directory "/var/git" do
  user "git"
  group "git"
  mode 0755
  action :create
end

include_recipe "agile::git-completion"

include_recipe "agile::git-flow"
