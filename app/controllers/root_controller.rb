class RootController < ApplicationController

    def create
        @posts=Post.all
        render "createPost"
    end  
    
    def add
       @post=Post.new()
       @post.title=params[:title]
       @post.description=params[:description]
       @post.emailId=User.find(session[:user_id]).email
       @post.save
       @posts=Post.all
       @response={
           :add=>true
       }
       redirect_to('/createPost')
    end   
    
    def displayAll
        @posts=Post.all
        render "displayAll"
    end 
    
    def delete
        @post=Post.find(params[:id])
        @post.destroy
        @posts=Post.all
        redirect_to('/createPost')
    end 
    
    def update
        if(session[:user_id]!=nil)
            @post=Post.find(params[:id])
            @id=params[:id]
            @title=@post.title
            @description=@post.description
            render "update"
        else
            redirect_to('/error')
        end  
    end      

    def updateform
            @post=Post.find(params[:id])
            @post.title=params[:title]
            @post.description=params[:description]
            @post.save
            @post=Post.all
            redirect_to('/createPost')
    end    

    def error
        render "error"
    end



end
