include_recipe "agile::apache"

include_recipe "agile::git"

link "/git" do
  to "/var/git"
end

link "/var/www/html/git" do
  to "/var/git"
end

link "/var/opt/alminium/git" do
  to "/var/git"
end
