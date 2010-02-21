require 'rubygems'
require 'sinatra'
require 'configs/deps'

config = YAML.load_file("configs/config.yml")
if config["logging"] == true
  log = File.new('log/sinatra.log', 'a+')
  $stderr.reopen(log)
end




set :environment, :"#{config['environment']}"
set :server, config["server"]
set :host, config["host"]
set :port, config["port"].to_i
set :views, 'app/views'
set :public, 'public'

enable :sessions, :logging, :dump_errors, :raise_errors, :static

load 'configs/configures.rb'

Dir.glob("app/controllers/**/*.rb") {|file| load file}
Dir.glob("app/models/**/*.rb") {|file| load file}
Dir.glob("app/helpers/**/*.rb") {|file| load file}

load "configs/routes.rb"
