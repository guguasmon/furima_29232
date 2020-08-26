class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,              null: false
      t.text :text,                null: false
      t.integer :category_id,      null: false
      t.integer :state_id,         null: false
      t.integer :delivery_type_id, null: false
      t.integer :prefecture_id,    null: false
      t.integer :duration_id,      null: false
      t.integer :price,            null: false
      t.timestamps
      
    end
  end
end
