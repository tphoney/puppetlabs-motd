require 'serverspec'
set :backend, :ssh

options = Net::SSH::Config.for(host)
options[:user] = 'root'
host = ENV['HOSTY']

set :host,        options[:host_name] || host
set :ssh_options, options

