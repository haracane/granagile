# ワーカーの数
worker_processes 2

# Rootディレクトリ
working_directory "/opt/alminium/"

# socket
listen '/opt/alminium/tmp/sockets/unicorn.sock', :backlog=>128
#listen 8080

# PID
pid "/opt/alminium/pids/unicorn.pid"

# log 
stderr_path File.expand_path('/opt/alminium/log/unicorn-access.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('/opt/alminium/log/unicorn-error.log', ENV['RAILS_ROOT'])

# no down time
preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      # SIGTTOU だと worker_processes が多いときおかしい気がする
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

