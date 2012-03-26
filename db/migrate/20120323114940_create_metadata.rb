class CreateMetadata < ActiveRecord::Migration
  def change
    create_table :metadata do |t|
      t.integer :image_id
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
