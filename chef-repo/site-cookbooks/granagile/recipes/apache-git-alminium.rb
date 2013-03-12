include_recipe "apache::apache"
include_recipe "apache::apache-on"

include_recipe "granagile::git"

link "/git" do
  to "/var/git"
end

link "/var/www/html/git" do
  to "/var/git"
end

link "/var/opt/alminium/git" do
  to "/var/git"
end
