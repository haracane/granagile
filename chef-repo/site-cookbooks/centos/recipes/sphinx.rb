include_recipe "centos::python-2.6.6"
include_recipe "centos::setuptools-0.6c11"
include_recipe "centos::pip"

execute "install sphinx" do
  user "root"
  command "pip install sphinx"
  creates "/usr/bin/sphinx-build"
end

include_recipe "centos::rst2pdf"
