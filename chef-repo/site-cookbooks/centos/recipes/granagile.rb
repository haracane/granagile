[
  "/opt/granagile",
  "/opt/granagile/script" ].each do |dirpath|
  directory dirpath do
    user "root"
    group "root"
    mode "0755"
  end
end
