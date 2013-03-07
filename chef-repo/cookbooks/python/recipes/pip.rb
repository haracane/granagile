execute "install pip" do
  user "root"
  command "easy_install pip"
  creates "/usr/bin/pip"
end
