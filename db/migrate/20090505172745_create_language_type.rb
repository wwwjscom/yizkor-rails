class CreateLanguageType < ActiveRecord::Migration
  def self.up
    create_table :language_types do |t|
      t.string :title
      t.timestamps
    end
    LanguageType.create(:title => 'Hebrew')
    LanguageType.create(:title => 'English')
    LanguageType.create(:title => 'Yiddish')
    LanguageType.create(:title => 'Romanian')
    LanguageType.create(:title => 'Hungarian')
    LanguageType.create(:title => 'Czech')
    LanguageType.create(:title => 'German')
    LanguageType.create(:title => 'Serbo Croatian')
    LanguageType.create(:title => 'Polish')
    LanguageType.create(:title => 'French')
    LanguageType.create(:title => 'Lithuanian')
    LanguageType.create(:title => 'Dutch')
    LanguageType.create(:title => 'Spanish')
  end

  def self.down
    drop_table :language_types
  end
end
