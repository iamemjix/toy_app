class RemoveImgAndImgId < ActiveRecord::Migration[7.0]
  def change
    remove_column :toys, :img_id, :string
    remove_column :toys, :img, :string
  end
end
