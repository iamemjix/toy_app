class AddImgToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :img, :string
  end
end
