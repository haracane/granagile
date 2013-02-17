[
  "/root/script"
  ].each do |dirpath|
  directory dirpath do
    owner "root"
    group "root"
    mode  "0755"
    action :create
  end
end

[
  "root/script/create-alminium-git.sh",
  "root/script/create-alminium-svn.sh",
  "etc/cron.d/create-alminium-vcs"
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

