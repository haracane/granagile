execute "install td" do
  user "root"
  command "curl -L http://toolbelt.treasure-data.com/sh/install-redhat.sh | sh"
  creates "/usr/bin/td"
end
