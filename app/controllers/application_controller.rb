require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in?
      !!session[:gamer_id]
    end

    def current_gamer
      @gamer ||= Gamer.find_by_id(session[:gamer_id])
    end
  end

end
