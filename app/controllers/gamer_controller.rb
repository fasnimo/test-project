class GamersController < ApplicationController

    get '/signup' do 
        erb :'gamers/new'
    end

    post '/signup' do
        if Gamer.find_by(:email => params["email"])
        redirect "/login"
        else
        gamer = Gamer.create(params)

        if gamer.save
            session[:gamer_id] = gamer.id
            redirect "/"
        else 
            redirect "/signup"
            end
        end
    end


    post '/gamers' do 
        @gamer = Gamer.new(params)
        if @gamer.save
            session[:gamer_id] = @gamer.id
            redirect "/forums"
        else
            erb  :"/gamers/new"
        end
    end
end