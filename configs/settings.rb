# :development, :production, :test
set :environment, :development

# thin, mongrel, webrick
set :server, "webrick"

set :host, "0.0.0.0"
set :port, 8080

set :views, 'app/views'
set :public, 'public'
set :static, true
set :raise_errors, true

set :logging, true
set :dump_errors, true

enable :sessions
