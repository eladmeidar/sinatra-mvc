set :environment, :development

set :server, "thin"
set :host, "0.0.0.0"
set :port, 8181

set :views, 'app/views'
set :public, 'public'
set :static, true
set :raise_errors, true

set :logging, true
set :dump_errors, true

enable :sessions
