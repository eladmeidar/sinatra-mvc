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
      (args + DEFAULT_DEPENDENCIES).each do |lib|
        begin
          require lib.to_s
        rescue LoadError
          puts "== Unable to load dependency - #{lib}"
          exit 0
        end
      end
    end
  end
  
  register Dependencies
end

