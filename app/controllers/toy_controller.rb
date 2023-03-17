class ToyController < ApplicationController
    before_action :req_user_signed_in
    before_action :req_cloudinary

    def new
        @toy = Toy.new
    end

    def create
        #checking if toy image is present in params
        if params[:toy][:img].present?
            upload_response = Cloudinary::Uploader.upload(params[:toy][:img])
            params[:toy][:img] = upload_response["secure_url"]
            params[:toy][:img_id] = upload_response["public_id"]
        end   

        respond_to do |format|
            @toy = Toy.new(toy_params)

            if @toy.save
                format.html { redirect_to root_path, notice:"Toy created successfully." }
            else
                format.html { render "toy/new", status: :unprocessable_entity }
            end
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def list
    end

    private
    def toy_params
        params.require(:toy).permit(:name, :category, :img, :img_id, :description, :user_id) #lagay img id tyaka user id
    end
end