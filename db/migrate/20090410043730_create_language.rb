class CreateLanguage < ActiveRecord::Migration
  def self.up
    create_table :language_types do |t|
      t.string :title
      t.timestamps
    end
    LanguageType.create(:title => 'English')

    create_table :languages do |t|
      t.integer :book_id
      t.integer :language_type_id
      t.timestamps
    end
  end

  def self.down
    drop_table :language_types
    drop_table :languages
  end
end
