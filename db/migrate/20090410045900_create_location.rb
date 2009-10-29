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

    create_table :locations do |t|
      t.integer :book_id
      # This is null when the below statement
      # is true
      t.integer :location_type_id
      # location_variations_id is only filled in
      # when the location associated with a book
      # is a variation of another location.
      t.integer :location_variation_id
      t.timestamps
    end

    create_table :location_variations do |t|
      t.integer :location_id
      t.string :name
      t.timestamps
    end

  LocationVariation.create(:name => 'Test_var', :location_id => 1)
  Location.create(:book_id => 1, :location_variation_id => 1)
  Location.create(:book_id => 2, :location_variation_id => 1)
  end


  def self.down
    drop_table :locations
    drop_table :location_variations
    drop_table :location_types
  end
end
