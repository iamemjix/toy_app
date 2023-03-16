class ToyController < ApplicationController
    def new
        @toy = Toy.new
    end

    def create
        respond_to do |format|
            @toy = Toy.new(toy_params)

            if @toy.save
                format.html { redirect_to toy_url(@toy), notice:"Toy created successfully." }
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
        params.require(:toy).permit(:name, :category, :img, :description)
    end
end