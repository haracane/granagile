include_recipe "python::setuptools-0.6c11-2.6"

execute "install pip" do
  user "root"
  command "easy_install-2.6 pip"
  creates "/usr/bin/pip-2.6"
end
