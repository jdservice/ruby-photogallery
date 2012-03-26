class CreateEnumeratedTypes < ActiveRecord::Migration
  def change
    create_table :enumerated_types do |t|
      t.string :group_name
      t.string :name

      t.timestamps
    end
  end
end
