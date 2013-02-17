["/root", "/root/src"].each do |dir_path|
  directory dir_path do
    owner "root"
    mode 0755
    action :create
  end
end
