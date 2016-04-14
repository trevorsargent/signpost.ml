#/bin/bash
echo "restarting server"
cat pids/unicorn.pid | xargs kill -QUIT
unicorn -c unicorn.rb -E producion -D
service nginx restart
