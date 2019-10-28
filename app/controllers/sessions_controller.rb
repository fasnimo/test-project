class SessionsController < ApplicationController
    
    get '/login' do
        erb :'sessions/login'
    end

    post '/sessions' do
        gamer = Gamer.find_by(email: params[:email])
        if gamer && gamer.authenticate(params[:password])
            session[:gamer_id] = gamer.id
            redirect '/forums'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end