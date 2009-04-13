class CreateUpload < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.integer :book_id
      t.integer :size
      t.string :content_type
      t.string :filename
      t.integer :height
      t.integer :width
      t.integer :parent_id
      t.string :thumbnail
      t.string :upload_type
    end
  end

  def self.down
    drop_table :uploads
  end
end
