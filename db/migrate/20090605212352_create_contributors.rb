class CreateContributors < ActiveRecord::Migration
  def self.up
    create_table :contributors do |t|
      t.integer :book_id
      t.string :first
      t.string :last
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :contributors
  end
end
