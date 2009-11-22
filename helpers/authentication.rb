module Sinatra

  module Authentication
    
    def logout!
      session.delete :authorized_user
    end

    def authenticated?
      session[:authorized_user]
    end

    def authenticate!
      session[:authorized_user] = true
    end

    def authorize!(redirect="/denied")
      redirect(redirect) unless authenticated?
    end

    get "/denied" do
       "Access denied!"
    end

    post "/denied" do
       "Access denied!"
    end

    alias_method :no_guest!, :authorize!
    alias_method :acts_as_member?, :authenticated?
    alias_method :bye!, :logout!

  end

  helpers Authentication
end
