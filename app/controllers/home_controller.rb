class HomeController < ApplicationController
    def index
        if session[:user_id]
            #finding user by column (find_by)
            @user = User.find_by(id: session[:user_id])
        end    
    end
end