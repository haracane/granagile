include_recipe "centos::python-2.6"

url = "http://pypi.python.org/packages/source/s/setuptools/setuptools-0.6c11.tar.gz"
archive = url.split(/\//)[-1]
dirname = archive.gsub(/\.tar\.gz$/, "")

execute "download setuptools" do
  user "root"
  cwd "/root/src"
  command "curl -L -O #{url}"
  creates "/root/src/#{archive}"
end

execute "extract setuptools" do
  user "root"
  cwd "/root/src"
  command "tar zxvf #{archive}"
  creates "/root/src/#{dirname}"
end

execute "install setuptools" do
  user "root"
  cwd "/root/src/#{dirname}"
  command "python26 setup.py install"
  creates "/usr/bin/easy_install-2.6"
end
