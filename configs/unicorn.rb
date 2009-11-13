worker_processes 4
#listen 'app.sock', :backlog => 1
listen 8181, :tcp_nopush => true
timeout 30
pid "tmp/unicorn.pid"

preload_app true

before_fork do |server, worker|
 old_pid = "#{server.config[:pid]}.oldbin"
 if old_pid != server.pid
   begin
    sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
    Process.kill(sig, File.read(old_pid).to_i)
   rescue Errno::ENOENT, Errno::ESRCH
   end
 end
 sleep 1
end

after_fork do |server, worker|
  server.listen("127.0.0.1:#{8080 + worker.nr}", :tries => -1, :delay => 5, :tcp_nopush => true)
end

