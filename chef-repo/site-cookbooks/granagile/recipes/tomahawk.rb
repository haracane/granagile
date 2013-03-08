include_recipe "granagile::pip"

execute "install tomahawk" do
  user "root"
  command "pip install tomahawk"
  creates "/usr/bin/tomahawk"
end
