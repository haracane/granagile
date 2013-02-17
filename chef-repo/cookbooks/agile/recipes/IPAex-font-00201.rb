url = "http://ossipedia.ipa.go.jp/ipafont/ipaexfont/IPAexfont00201.php"
archive = url.split(/\//)[-1]
dirname = archive.gsub(/\.php$/, "")

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

execute "install IPA font" do
  user "root"
  cwd "/root/src/#{dirname}"
  command "cp *.ttf /usr/share/fonts/"
  creates "/usr/share/fonts/ipaexg.ttf"
end
