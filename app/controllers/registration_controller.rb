class RegistrationController < ApplicationController
    def new_user
        @user = User.new
    end

    #getting user's info in parameters then inserting it to the model
    def create
        respond_to do |format|
            @user = User.new(user_params)
    
            if @user.save
                #Login using session cookies
                session[:user_id] = @user.id
                #Redirection once account created.
                format.html { redirect_to root_path, notice: "Account created successfully!"}
            else 
                format.html { render "registration/new_user", status: :unprocessable_entity }
            end
        end
    end

    private

    #raise an error if the user is not found. only permitting user to get ff info.
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation) 
    end
end