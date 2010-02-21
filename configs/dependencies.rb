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
      puts "== Loaded dependencies: #{(args + DEFAULT_DEPENDENCIES).uniq.join(', ')}"
    end
    
    def start_app!( parameters = {} )
      required_dependencies = parameters[:libs] ||= []
      config_file = parameters[:config_file] ||= 'configs/config.yml'
      orm_name = parameters[:orm] ||= false
      

      # Load configuration
      config = YAML.load_file(config_file)
      
      # Setup log file if required
      if config["logging"] == true
        log = File.new(config['log_file'], 'a+')
        $stderr.reopen(log)
      end
      
      # Load default gems
      load_dependencies *((required_dependencies + config['required_dependencies'].to_s.split(',').collect(&:strip)).uniq)

      # Setup default options
      
      set :environment, config['environment'] ||= ENV['RACK_ENV']
      set :server, config["server"]
      set :host, config["host"]
      set :port, config["port"].to_i
      set :views, 'app/views'
      set :public, 'public'

      enable :sessions, :logging, :dump_errors, :raise_errors, :static
      
      # load defaults and configuration
      load 'configs/configures.rb'
      load "configs/default_routes.rb"
            
      if !orm_name
        puts "== No ORM loaded"
      else
        begin
          puts "== ORM selected: #{orm_name}"
          require "configs/orms/#{orm_name}" 
        rescue LoadError
          puts "Could not find an ORM extention in configs/orms for '#{orm_name}'"
          exit 0
        end
      end
      
      # Load models, controllers an helpers
      Dir.glob("app/controllers/**/*.rb") {|file| load file}
      Dir.glob("app/models/**/*.rb") {|file| load file}
      Dir.glob("app/helpers/**/*.rb") {|file| load file}
    end
  end
  
  register Dependencies
end

