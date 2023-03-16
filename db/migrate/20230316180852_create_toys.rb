class CreateToys < ActiveRecord::Migration[7.0]
  def change
    create_table :toys do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :category
      t.text :description
      t.string :img_id
      t.string :img

      t.timestamps
    end
  end
end
