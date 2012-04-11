class CreateImagesTags < ActiveRecord::Migration

  def up
    create_table :images_tags, :id => false do |t|
      t.integer :image_id
      t.integer :tag_id
    end
    add_index :images_tags, [:image_id, :tag_id], :unique  => true

  end

  def down
    drop_table :images_tags
  end

end
