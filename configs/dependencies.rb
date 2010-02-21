# require "yaml"
# require 'sinatra/base'
# 
# ## Session Manager/Authenication
# 
# # stuff here..
# 
# ## Template Engine
# 
# #require 'haml'
# require 'erb'
# #require 'liquid'
# #require 'ruty'
# #require 'mustache' 
# 
# ## Database
# 
# #require 'ohm'
# #require 'sequel'
# #require 'datamapper'

require 'sinatra/base'
module Sinatra
  module Dependencies
    
    DEFAULT_DEPENDENCIES = [:yaml, :erb, :json]
    
    def load_dependencies(*args)
      (args + DEFAULT_DEPENDENCIES).uniq.each do |lib|
        begin
          require lib.to_s
        rescue LoadError
          puts "== Unable to load dependency - #{lib}"
          exit 0
        end
      end
    end
    
    def start_app!(config_file = 'configs/config.yml', required_dependencies = [])
      
      config = YAML.load_file(config_file)
      if config["logging"] == true
        log = File.new(config['log_file'], 'a+')
        $stderr.reopen(log)
      end

      # Load default gems
      load_dependencies *required_dependencies


      set :environment, :"#{config['environment']}"
      set :server, config["server"]
      set :host, config["host"]
      set :port, config["port"].to_i
      set :views, 'app/views'
      set :public, 'public'

      enable :sessions, :logging, :dump_errors, :raise_errors, :static
      load 'configs/configures.rb'
      load "configs/default_routes.rb"
      Dir.glob("app/controllers/**/*.rb") {|file| load file}
      Dir.glob("app/models/**/*.rb") {|file| load file}
      Dir.glob("app/helpers/**/*.rb") {|file| load file}
    end
  end
  
  register Dependencies
end

