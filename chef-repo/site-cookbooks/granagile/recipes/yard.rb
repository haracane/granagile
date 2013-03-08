["yard", "redcarpet"].each do |pkg|
  gem_package pkg do
    action :install
  end
end
