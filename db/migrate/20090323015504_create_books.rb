class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.integer :publication_year
      t.string :publication_place
      t.string :historical_period
      t.boolean :has_necrology
      t.boolean :has_toc
      t.boolean :has_index
      t.text :description
      t.text :characteristics
      t.text :table_of_contents
      t.boolean :has_images
      t.text :other_notes
      t.text :abstract
      t.string :keywords
      t.boolean :deleted
      t.text :quotations
      t.string :nypl_link
      t.boolean :has_maps
      t.boolean :approved, :default => false

      t.timestamps
    end
    Book.create(:title => 'test', :has_index => true, :publication_year => '2009')
    Book.create(:title => 'Antopol : mi-toldoteha shel kehilah ahat be-Polesyah', :publication_place => 'Isreal', :publication_year => 1966, :approved => true)
    Book.create(:title => "Sefer Z'eludok ve-Orlovah : gal`ed le-zikaron", :publication_place => 'Israel', :publication_year => 1967, :approved => true)
  end

  def self.down
    drop_table :books
  end
end
