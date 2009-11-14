log = File.new('log/sinatra.log', 'a+')
$stderr.reopen(log)

require 'rubygems'
require 'sinatra'
require 'configs/deps'

load 'configs/settings.rb'
load 'configs/configures.rb'

Dir.glob("app/controllers/*.rb") {|file| load file}
Dir.glob("app/models/*.rb") {|file| load file}
Dir.glob("helpers/*.rb") {|file| load file}

load "configs/routes.rb"
