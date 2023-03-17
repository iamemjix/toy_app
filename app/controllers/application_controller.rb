class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            #finding user by column (find_by)
            Current.user = User.find_by(id: session[:user_id])
        end   
    end

    def req_user_signed_in
        if Current.user.nil?
            redirect_to sign_in_path, notice: "User must be logged in."
        end
    end

    def req_cloudinary
        require './config'
        require 'json'
    end
end
