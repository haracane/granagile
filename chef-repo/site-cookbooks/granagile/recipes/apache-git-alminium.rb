include_recipe "granagile::apache"

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
