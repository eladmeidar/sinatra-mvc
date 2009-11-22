require "yaml"
require 'rubygems'
require 'sinatra'
require 'configs/deps'

class MVC < Sinatra::Base
  @config = YAML.load_file("configs/config.yml")
  if @config["logging"] == true
    log = File.new('log/sinatra.log', 'a+')
    $stderr.reopen(log)
  end
  load 'configs/configures.rb'
  set :environment, :"#{@config['environment']}"
  set :server, @config["server"]
  set :host, @config["host"]
  set :port, @config["port"].to_i
  set :views, 'app/views'
  set :public, 'public'
  enable :sessions, :logging, :dump_errors, :raise_errors, :static

  Dir.glob("app/controllers/*.rb") {|file| load file}
  Dir.glob("app/models/*.rb") {|file| load file}
  Dir.glob("helpers/*.rb") {|file| load file}

  load "configs/routes.rb"

end