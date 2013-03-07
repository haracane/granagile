include_recipe "hadoop::yum-repos-cloudera-cdh3"

["hadoop-0.20", "hadoop-hive", "hadoop-pig"].each do |name|
  package name do
    action :install
  end
end

user "hdfs" do
  gid "hadoop"
end

user "mapred" do
  gid "hadoop"
end
