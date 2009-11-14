require File.dirname(__FILE__) + "/spec_helper"

describe "main app" do
  include Rack::Test::Methods
  def app
    Sinatra::Application.new
  end
  specify 'should show the welcome page' do
   get '/welcome/'
   last_response.should be_ok
  end
end
