include_recipe "granagile::yum-repos-epel"

include_recipe "granagile::yum-repos-remi"

execute "yum install php php-cli php-fpm php-devel php-gd php-mbstring php-mysql php-pdo php-pear" do
  user "root"
  command "yum --enablerepo=remi -y install php php-cli php-fpm php-devel php-gd php-mbstring php-mysql php-pdo php-pear"
end

execute "config /etc/php.ini" do
  user "root"
  command <<-EOF
  sed 's/short_open_tag = .*/short_open_tag = On/' -i /etc/php.ini
  sed 's/expose_php = .*/expose_php = Off/' -i /etc/php.ini
  sed 's/max_execution_time = .*/max_execution_time = 30/' -i /etc/php.ini
  sed 's/error_reporting  =  .*/error_reporting  =  E_ALL & ~E_NOTICE/' -i /etc/php.ini
  sed 's/magic_quotes_gpc = .*/magic_quotes_gpc = Off/' -i /etc/php.ini
  sed 's/;default_charset = .*/default_charset = "UTF-8"/' -i /etc/php.ini
  sed 's/upload_max_filesize = .*/upload_max_filesize = 20M/' -i /etc/php.ini
  sed 's/;date.timezone =.*/date.timezone = Asia\\/Tokyo/' -i /etc/php.ini
  sed 's/;mbstring.internal_encoding = .*/mbstring.internal_encoding = UTF-8/' -i /etc/php.ini
  sed 's/;mbstring.http_input = .*/mbstring.http_input = auto/' -i /etc/php.ini
  sed 's/;mbstring.http_output = .*/mbstring.http_output = pass/' -i /etc/php.ini
  sed 's/;mbstring.encoding_translation = .*/mbstring.encoding_translation = On/' -i /etc/php.ini
  sed 's/;mbstring.detect_order = .*/mbstring.detect_order = auto/' -i /etc/php.ini
  sed 's/;mbstring.substitute_character = .*/mbstring.substitute_character = none;/' -i /etc/php.ini
  EOF
end

