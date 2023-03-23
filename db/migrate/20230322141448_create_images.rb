class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.references :toy, null: false, foreign_key: true
      t.string :img_id
      t.string :img_string

      t.timestamps
    end
  end
end
