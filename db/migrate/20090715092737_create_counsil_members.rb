class CreateCounsilMembers < ActiveRecord::Migration
  def self.up
    create_table :counsil_members do |t|
      t.integer :book_id
      t.string :first
      t.string :last

      t.timestamps
    end
  end

  def self.down
    drop_table :counsil_members
  end
end
