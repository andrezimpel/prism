set :stage, :production

set :deploy_to, '/var/www/prism'

set :default_env, {
  rvm_bin_path: '/usr/local/rvm/bin',
  path: '/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin',
}

# Replace 127.0.0.1 with your server's IP address!
server '178.62.234.154', user: 'deploy', roles: %w{web app}
