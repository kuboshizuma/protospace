class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      t.string :name, null: false
      t.integer :status
      t.integer :prototype_id

      t.timestamps null: false
    end
    add_index :prototype_images, :prototype_id
  end
end
