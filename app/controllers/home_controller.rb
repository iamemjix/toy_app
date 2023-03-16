class HomeController < ApplicationController
    def index
        @user = "Test"
        redirect_to sign_up_path
    end
end

