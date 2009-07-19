class CreateKeywords < ActiveRecord::Migration
  def self.up
    create_table :keywords do |t|
      t.integer :title_id
      t.integer :book_id

      t.timestamps
    end
  end

  def self.down
    drop_table :keywords
  end
end
