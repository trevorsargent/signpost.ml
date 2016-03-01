working_directory "/var/www/signpostml"

pid "/var/www/signpostml/pids/unicorn.pid"

stderr_path "/var/www/signpostml/logs/unicorn.log"
stdout_path "/var/www/signpostml/logs/unicorn.log"

listen "/tmp/unicorn.signpostml.sock"

worker_processes 2

timeout 30
