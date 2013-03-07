[ "etc/yum.repos.d/mirrors-rpmforge",
  "etc/yum.repos.d/rpmforge-testing.repo",
  "etc/yum.repos.d/rpmforge.repo",
  "etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag"].each do |filename|
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
