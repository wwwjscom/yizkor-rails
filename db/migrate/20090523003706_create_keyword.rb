class CreateKeyword < ActiveRecord::Migration
  def self.up
    create_table :keywords do |t|
      t.string :title
      t.integer :book_id

      t.timestamps
    end
  end

  def self.down
    drop_table :keywords
  end
end
