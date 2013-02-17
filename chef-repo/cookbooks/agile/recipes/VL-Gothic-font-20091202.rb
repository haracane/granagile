url = "http://jaist.dl.sourceforge.jp/vlgothic/44715/VLGothic-20091202.zip"
archive = url.split(/\//)[-1]
#dirname = archive.gsub(/\.zip$/, "")
dirname = "VLGothic"

execute "download #{archive}" do
  user "root"
  cwd "/root/src"
  command "curl -L -O #{url}"
  creates "/root/src/#{archive}"
end

execute "extract #{archive}" do
  user "root"
  cwd "/root/src"
  command "unzip -o #{archive}"
  creates "/root/src/#{dirname}"
end

execute "install VL-Gothic font" do
  user "root"
  cwd "/root/src/#{dirname}"
  command "cp *.ttf /usr/share/fonts/"
  creates "/usr/share/fonts/VL-Gothic-Regular.ttf"
end
