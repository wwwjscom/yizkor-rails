class CreateKeywordType < ActiveRecord::Migration
  def self.up
    create_table :keyword_types do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :keyword_types
  end
end
