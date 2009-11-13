module Sinatra
  module Authorization
    def authorized?
      session[:authorized]
    end
    def authorize!
      redirect "/authorized" unless authorized?
    end
    get "/authorized" do
       "Authorized user only!"
    end
  end
  helpers Authorization
end
