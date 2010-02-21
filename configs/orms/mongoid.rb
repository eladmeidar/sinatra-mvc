require 'sinatra/base'
require 'mongoid'
 
module Sinatra
  module MongoidExtension
    def self.registered(app)
      
      database_config = YAML.load_file('configs/database.yml')[app.environment.to_s]

      app.set :mongo_host, database_config['host'] || 'localhost'
      app.set :mongo_db, database_config['database'] || 'changeme'
      app.set :mongo_port, database_config['port'] || Mongo::Connection::DEFAULT_PORT
      app.set :mongo_user, database_config['username']
      app.set :mongo_password, database_config['password']
 
      Mongoid.database = Mongo::Connection.new(app.mongo_host,app.mongo_port).
                                           db(app.mongo_db)
      if app.mongo_user
        Mongoid.database.authenticate(app.mongo_user,
                                      app.mongo_password)
      end
      
      puts "== Connected to a Mongo db '#{app.mongo_db}' on '#{app.mongo_host}:#{app.mongo_port}'"
    end
  end
 
  register MongoidExtension
end