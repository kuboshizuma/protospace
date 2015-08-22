class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      t.string :image
      t.integer :type
      t.integer :prototype_id

      t.timestamps null: false
    end
    add_index :prototype_images, :prototype_id
  end
end
