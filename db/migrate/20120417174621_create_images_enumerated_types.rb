class CreateImagesEnumeratedTypes < ActiveRecord::Migration
  def up
    create_table :images_enumerated_types, :id => false do |t|
      t.integer :image_id
      t.integer :enumerated_type_id
    end
    add_index :images_enumerated_types, [:image_id, :enumerated_type_id], :unique => true
  end

  def down
    drop_table :images_enumerated_types
  end
end
