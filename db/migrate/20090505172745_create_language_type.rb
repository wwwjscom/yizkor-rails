class CreateLanguageType < ActiveRecord::Migration
  def self.up
    create_table :language_types do |t|
      t.string :title
      t.timestamps
    end
    LanguageType.create(:title => 'English')
    LanguageType.create(:title => 'Hebrew')
    LanguageType.create(:title => 'Yiddish')
  end

  def self.down
    drop_table :language_types
  end
end
