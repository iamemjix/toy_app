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
        @image = Hash.new

        #getting img depends on toy id
        if @toy.empty? == false
            @toy.each do |toy|
                @image[toy.id] = Image.where(toy_id: toy.id)
            end
        end
    end

    def current_list
        @toy = Toy.where(user_id: Current.user.id)
    end

    def create
        @toy = Current.user.toys.new(toy_params.except(:image))

        #checking if toy image is present in params
        if params[:toy].has_key?(:image) && params[:toy][:image][:img].empty? == false
            image_params = []

            params[:toy][:image][:img].each do |image|
                upload_response = Cloudinary::Uploader.upload(image)

                image_hash = {img: upload_response["secure_url"], img_id: upload_response["public_id"]}
                image_params.push(image_hash)
            end

            image_params.each do |img|
                @image = @toy.images.new(img)
                @image.save
            end
        end

        respond_to do |format|
            if @toy.save
                format.html { redirect_to root_path, notice: "Toy created successfully." }
            else
                format.html { redirect_to create_toy_path, status: :unprocessable_entity, notice: "Error occured. Please retry."}
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
        params.require(:toy).permit(:name, :category, :description, :user_id)
    end

end