server '52.199.192.245', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/c/Users/naho/.ssh/id_rsa'
