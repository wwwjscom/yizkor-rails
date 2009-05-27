class CreateDigitizedLink < ActiveRecord::Migration
  def self.up
    create_table :digitized_links do |t|
      t.integer :book_id
      t.string :link
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :digitized_links
  end
end
