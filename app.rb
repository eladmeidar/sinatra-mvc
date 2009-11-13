require 'rubygems'
require 'sinatra'
require 'configs/deps'

load 'configs/settings.rb'

Dir.glob("app/controllers/*.rb") {|file| load file}
Dir.glob("app/models/*.rb") {|file| load file}
Dir.glob("helpers/*.rb") {|file| load file}

load "configs/routes.rb"
