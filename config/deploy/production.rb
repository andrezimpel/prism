set :stage, :production

set :deploy_to, '/var/www/prism'

set :rvm_custom_path, '/usr/local/rvm/bin'

# Replace 127.0.0.1 with your server's IP address!
server '178.62.234.154', user: 'deploy', roles: %w{web app}
