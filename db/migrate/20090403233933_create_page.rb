class CreatePage < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :book_id
      t.string :page
      t.timestamps
    end
    Page.create(:page => 'this is a page', :book_id => 1)
    Page.create(:page => 'page 2', :book_id => 1)
  end

  def self.down
    drop_table :pages
  end
end
