class CreateEnumeratedTypesImages < ActiveRecord::Migration
  def up
    create_table :enumerated_types_images, :id => false do |t|
      t.integer :image_id
      t.integer :enumerated_type_id
    end
    add_index :enumerated_types_images, [:image_id, :enumerated_type_id], :unique
  end

  def down
    drop_table :enumerated_types_images
  end
end
