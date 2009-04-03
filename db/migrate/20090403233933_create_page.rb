class CreatePage < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :book_id
      t.string :page
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
