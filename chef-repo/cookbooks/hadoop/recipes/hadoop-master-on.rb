["hadoop-0.20-namenode", "hadoop-0.20-secondarynamenode", "hadoop-0.20-jobtracker"].each do |name|
  service name do
    supports :status => true, :start => true, :stop => true, :restart => true
    action :enable
  end
end
