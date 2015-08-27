class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :title
      t.string :catch_copy
      t.text :concept
      t.integer :user_id
      t.timestamps null: false
    end
    add_index :prototypes, :user_id
  end
end
