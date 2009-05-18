class CreateLocation < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :book_id
      t.string :name
      t.integer :population
      t.integer :pre_wwii_population
      t.string :coordinates
      t.string :country
      t.timestamps
    end
    Location.create(:book_id => 3, :name => 'Orlovo', :country => 'Belarus')

    create_table :location_variations do |t|
      t.integer :location_id
      t.string :name
      t.timestamps
    end
    Location.create(:book_id => 1, :population => 200, :pre_wwii_population => 100)
  end

  def self.down
    drop_table :locations
    drop_table :location_variations
  end
end
