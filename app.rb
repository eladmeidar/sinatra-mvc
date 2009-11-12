require 'rubygems'
require 'sinatra'
require 'configs/deps'
require 'configs/settings'

Dir.glob("controllers/*.rb") {|file| require file}
Dir.glob("models/*.rb") {|file| require file}
Dir.glob("helpers/*.rb") {|file| require file}

get '/css/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"css/#{params[:name]}"
end

require "configs/routes"
