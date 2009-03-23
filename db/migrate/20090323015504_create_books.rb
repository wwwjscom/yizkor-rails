class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.integer :publication_year
      t.string :publication_place
      t.string :historical_period
      t.boolean :has_necrology
      t.boolean :has_toc
      t.boolean :has_index
      t.text :description
      t.text :characteristics
      t.text :table_of_contents
      t.boolean :has_images
      t.text :other_notes
      t.text :abstract
      t.string :keywords
      t.string :dig_book
      t.boolean :deleted

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
