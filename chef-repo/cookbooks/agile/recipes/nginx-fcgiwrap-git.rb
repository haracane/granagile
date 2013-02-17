include_recipe "agile::nginx"

include_recipe "agile::fcgiwrap"

include_recipe "agile::git"

link "/git" do
  to "/var/git"
end

link "/var/www/html/git" do
  to "/var/git"
end

[
  "etc/nginx/conf.d/default/git.conf",
  "etc/nginx/conf.d/ssl/git.conf"
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