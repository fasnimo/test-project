class GamersController < ApplicationController

    get '/signup' do 
        erb :'gamers/new'
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