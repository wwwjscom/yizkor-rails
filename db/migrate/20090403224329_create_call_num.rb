class CreateCallNum < ActiveRecord::Migration
  def self.up
    create_table :call_nums do |t|
      t.integer :book_id
      t.string :call_num
      t.timestamp
    end
  end

  def self.down
    drop_table :call_nums
  end
end
