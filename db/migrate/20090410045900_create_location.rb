class CreateLocation < ActiveRecord::Migration
  def self.up
    create_table :location_types do |t|
      t.string :name
      t.integer :population
      t.integer :pre_wwii_population
      t.string :coordinates
      t.string :country
      t.timestamps
    end
    LocationType.create(:name => 'Orlovo', :country => 'Belarus')
    LocationType.create(:name => 'Somewhere', :population => 200, :pre_wwii_population => 100)

    create_table :locations do |t|
      t.integer :book_id
      t.integer :location_type_id
      t.timestamps
    end
    Location.create(:book_id => 3, :location_type_id => 1)

    create_table :location_variations do |t|
      t.integer :location_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
    drop_table :location_variations
    drop_table :location_types
  end
end
