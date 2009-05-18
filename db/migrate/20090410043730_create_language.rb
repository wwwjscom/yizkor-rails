class CreateLanguage < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.integer :book_id
      t.integer :language_type_id
      t.timestamps
    end
    #Language.create(:book_id => 3, :language_type_id => 2)
    #Language.create(:book_id => '3', :language_type_id => 3)
  end

  def self.down
    drop_table :languages
  end
end
