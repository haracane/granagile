[
  "opt/granagile/script/create-alminium-git.sh",
  "opt/granagile/script/create-alminium-svn.sh"
  ].each do |filename|
  filepath = "/#{filename}"
  template filepath do
    source "#{filename}.erb"
  end
  file filepath do
    owner "root"
    group "root"
    mode  "0755"
  end
end

[
  "etc/cron.d/create-alminium-vcs"
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

