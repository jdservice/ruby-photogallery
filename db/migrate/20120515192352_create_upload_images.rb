class CreateUploadImages < ActiveRecord::Migration
  def change
    create_table :upload_images do |t|

      t.timestamps
    end
  end
end
