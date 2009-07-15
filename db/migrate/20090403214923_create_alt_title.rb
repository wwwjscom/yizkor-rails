class CreateAltTitle < ActiveRecord::Migration
  def self.up
    create_table :alternate_titles do |t|
      t.integer :book_id
      t.string :title
      t.timestamps
    end
    AltTitle.create(:title => 'alt test', :book_id => 1)
  end

  def self.down
    drop_table :alternate_titles
  end
end
