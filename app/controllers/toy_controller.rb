class ToyController < ApplicationController
    before_action :req_user_signed_in
    before_action :req_cloudinary

    def new
        @toy = Toy.new
    end

    def edit
        @toy = Toy.find_by(id: params[:id])    
    end

    def view
        @toy = Toy.find_by(id: params[:id])
    end

    def list
        @toy = Toy.all
    end

    def current_list
        @toy = Toy.where(user_id: Current.user.id)
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
                format.html { redirect_to toy_list_path, notice:"Toy created successfully." }
            else
                format.html { render "toy/new", status: :unprocessable_entity }
            end
        end
    end

    def update
        @toy = Toy.find_by(id: params[:id])
        if params[:toy][:img].present?
            Cloudinary::Uploader.destroy(@toy.img_id)
            upload_response = Cloudinary::Uploader.upload(params[:toy][:img])
            params[:toy][:img] = upload_response["secure_url"]
            params[:toy][:img_id] = upload_response["public_id"]
        end 

        respond_to do |format|
            if @toy.update(toy_params)
                format.html { redirect_to toy_list_path, notice:"Toy updated successfully." }
            else
                format.html { render "toy/edit", status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @toy = Toy.find_by(id: params[:id])
        @toy.destroy

        respond_to do |format|
            format.html { redirect_to toy_list_path, notice: "Toy app was successfully destroyed." }
        end
    end

    private
    def toy_params
        params.require(:toy).permit(:name, :category, :img, :img_id, :description, :user_id) #lagay img id tyaka user id
    end

end