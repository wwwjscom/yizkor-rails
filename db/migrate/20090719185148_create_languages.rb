class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.integer :book_id
      t.integer :language_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :languages
  end
end
