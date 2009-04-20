class CreateCouncilMembers < ActiveRecord::Migration
  def self.up
    create_table :council_members do |t|
      t.integer :book_id
      t.string :first
      t.string :last
      t.timestamps
    end
  end

  def self.down
    drop_table :council_members
  end
end
