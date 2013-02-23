filenames = [
  "etc/yum.repos.d/epel.repo",
  "etc/yum.repos.d/epel-testing.repo"
]

case node[:platform_version].split(/\./)[0]
when "5"
  filenames.push "etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL"
when "6"
  filenames.push "etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6"
end

filenames.each do |filename|
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
