include_recipe "python::python-2.6.6"
include_recipe "python::setuptools-0.6c11"
include_recipe "python::pip"

execute "install sphinx" do
  user "root"
  command "pip install sphinx"
  creates "/usr/bin/sphinx-build"
end

include_recipe "sphinx::rst2pdf"
