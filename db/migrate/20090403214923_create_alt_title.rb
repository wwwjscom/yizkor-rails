class CreateAltTitle < ActiveRecord::Migration
  def self.up
    create_table :alt_titles do |t|
      t.integer :book_id
      t.string :title
    end
  end

  def self.down
    drop_table :alt_titles
  end
end
