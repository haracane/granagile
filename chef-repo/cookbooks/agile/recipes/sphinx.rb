include_recipe "agile::python-2.6.6"
include_recipe "agile::setuptools-0.6c11"
include_recipe "agile::pip"

execute "install sphinx" do
  user "root"
  command "pip install sphinx"
  creates "/usr/bin/sphinx-build"
end

include_recipe "agile::rst2pdf"
