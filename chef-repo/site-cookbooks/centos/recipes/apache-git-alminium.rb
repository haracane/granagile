include_recipe "centos::apache"

include_recipe "centos::git"

link "/git" do
  to "/var/git"
end

link "/var/www/html/git" do
  to "/var/git"
end

link "/var/opt/alminium/git" do
  to "/var/git"
end
