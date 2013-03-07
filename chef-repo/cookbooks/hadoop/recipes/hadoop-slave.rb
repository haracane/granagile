["hadoop-0.20-datanode", "hadoop-0.20-tasktracker"].each do |name|
  package name do
    action :install
  end
end
