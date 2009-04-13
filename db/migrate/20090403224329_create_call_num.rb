class CreateCallNum < ActiveRecord::Migration
  def self.up
    create_table :call_nums do |t|
      t.integer :book_id
      t.string :call_num
      t.timestamp
    end
    CallNum.create(:call_num => '1', :book_id => 1)
  end

  def self.down
    drop_table :call_nums
  end
end
