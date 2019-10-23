class UsersController < ApplicationController

    get '/signup' do 
        erb :'users/new'
    end

    post '/users' do 
        @user = User.new(params)

        if @user.save
            session[:user_id] = @user.id
            redirect "/posts"
        else
            erb  :"/users/new"
        end

    end
end