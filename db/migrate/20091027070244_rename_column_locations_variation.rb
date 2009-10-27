class RenameColumnLocationsVariation < ActiveRecord::Migration
  def self.up
    rename_column :location_variations, :location_id, :location_type_id
  end

  def self.down
    rename_column :location_variations, :location_type_id, :location_id
  end
end
