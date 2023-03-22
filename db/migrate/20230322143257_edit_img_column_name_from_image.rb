class EditImgColumnNameFromImage < ActiveRecord::Migration[7.0]
  def change
    remove_column :images, :img_string, :string
  end
end
