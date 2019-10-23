class PostsController < ApplicationController
   
    #index
    get '/posts' do 
        if logged_in?
            @user = current_user
            @posts = current_user.posts
            
            erb :'posts/index'
        else
            redirect '/signup'
        end
    end
    
    #show_all
    get '/posts/all' do 
        if logged_in?
            @posts = Post.all
            erb :'posts/index'
        else
            redirect '/signup'
        end
        
    end

    #new
    get "/posts/new" do 
        @users = User.all
        erb :'posts/new'
    end
    
    #edit
    get "/posts/:id/edit" do 
        post_user = Post.find_by_id(params[:id]).user
         if post_user.id == current_user.id
            @post = Post.find_by_id(params[:id])
            erb :'posts/edit'
        else 
            flash[:err] = "You aren't authorized to modify the selected post."
            redirect "/posts"
        end
    end
    
    #update
    patch "/posts/:id" do 
        post_user = Post.find_by_id(params[:id]).user
        if post_user.id == current_user.id
            @post = Post.find_by_id(params[:id])
            params.delete("_method")
            if @post.update(params)
                redirect "/posts/#{@post.id}"
            else
                redirect "/posts/#{@post.id}/edit"
            end
        else
            flash[:err] = "You aren't authorized to modify the selected post."
            erb :"/posts/index"
        end
    end

    #show
    get '/posts/:id' do
        @post = Post.find_by_id(params[:id])

        if @post 
            erb :'posts/show'
        else
            redirect "/posts"
        end
    end

    #create
    post "/posts" do
        # uses ActiveRecord associations to simultaneously
        # create the new post and push it into the current_user's
        # collection of posts
        @p = current_user.posts.build(params)
        
        # triggers ActiveRecord validations on .save
        # returns boolean to indicate whether or not passed 
        # validatoins and saved successfully
        if @p.save
            redirect "/posts"
        else
            erb  :"/posts/new"
        end
    end

    #delete
    delete '/posts/:id' do
        post_user = Post.find_by_id(params[:id]).user
        if post_user.id == current_user.id
            Post.destroy(params[:id])
            redirect :'/posts'
        else
            #flash[:err] = "You aren't authorized to modify the selected post."
            redirect :'/posts'
        end
    end

end