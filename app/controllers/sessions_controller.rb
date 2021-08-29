class SessionsController < ApplicationController
    def new
    end    

    def create
        email=params[:username]
        password=params[:userpassword]
        user=User.find_by(:email=>email)
        if user && user.password_digest==password
            response={
                :loggedIn=>true 
            }
            session[:user_id]=user.id
            redirect_to('/landing')
           
        else
            @loggedIn=false   
            render "new"
        end  
    end    

    def destroy
        session[:user_id]=nil
        redirect_to landing_path
    end    

end