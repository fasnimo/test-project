require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'session secret'
    
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
     def is_authorized?
      forum_gamer = Forum.find_by_id(params[:id]).gamer
       forum_gamer.id == current_gamer.id 
    end 
  end

end
