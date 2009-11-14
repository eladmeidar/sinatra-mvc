require "yaml"
config = YAML.load_file("configs/config.yml")

# :development, :production, :test
set :environment, :"#{config['environment']}"

# thin, mongrel, webrick
set :server, config["server"]

set :host, config["host"]
set :port, config["port"].to_i

set :views, 'app/views'
set :public, 'public'
set :static, true
set :raise_errors, true

set :logging, true
set :dump_errors, true

enable :sessions
