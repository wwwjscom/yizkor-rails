class CreateLocations < ActiveRecord::Migration
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
    create_table :location_variations do |t|
      t.integer :location_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
    drop_table :location_variations
  end
end
