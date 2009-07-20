class CreateAlternateTitle < ActiveRecord::Migration
  def self.up
    create_table :alternate_titles do |t|
      t.integer :book_id
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :alternate_titles
  end
end
