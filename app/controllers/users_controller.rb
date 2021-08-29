class UsersController < ApplicationController
    def new
        render "new"
    end    

    def create
        email=params[:username]
        password=params[:userpassword]
        user=User.find_by(:email=>email)
        if user
            @register=false
            render "new"
        else
            newUser=User.new();
            newUser.email=email;
            newUser.password_digest=password;
            newUser.save
            @register=true
            render "new"
        end    
    end    

    def destroy
    end   
    
    def landing
        @posts=Post.all
        render "layouts/landing"
    end    

end
