class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :group_id
      t.string :file_name
      t.string :file_type
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
