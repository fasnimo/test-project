class ForumsController < ApplicationController
   
    #index
    get '/forums' do 
        # flash[:notice] = "Hooray we are here!" #comeback to this.
        if logged_in?
            @gamer = current_gamer
            @forums = current_gamer.forums
            
            erb :'forums/index'
        else
            redirect '/signup'
        end
    end
    
    #show_all
    get '/forums/all' do 
        if logged_in?
            @forums = Forum.all
            erb :'forums/index'
        else
            redirect '/signup'
        end
        
    end

    #new
    get "/forums/new" do 
        @gamers = Gamer.all
        erb :'forums/new'
    end
    
    #edit
    get "/forums/:id/edit" do 

        if is_authorized?
            @forum = Forum.find_by_id(params[:id])
            erb :'forums/edit'
        else 
            redirect "/forums"
        end
    end
    
    #update
    patch "/forums/:id" do 
        if is_authorized?
            @forum = Forum.find_by_id(params[:id])
            params.delete("_method")
            if @forum.update(params)
                redirect "/forums/#{@forum.id}"
            else
                redirect "/forums/#{@forum.id}/edit"
            end
        else
            erb :"/forums/index"
        end
    end

    #show
    get '/forums/:id' do
        @forum = Forum.find_by_id(params[:id])

        if @forum 
            erb :'forums/show'
        else
            redirect "/forums"
        end
    end

    #create
    post "/forums" do
        @g = current_gamer.forums.build(params)

        if @g.save
            redirect "/forums"
        else
            erb  :"/forums/new"
        end
    end

    #delete
    delete '/forums/:id' do
        if is_authorized?
            Forum.destroy(params[:id])
            redirect :'/forums'
        else
            redirect :'/welcome'
        end
    end

end