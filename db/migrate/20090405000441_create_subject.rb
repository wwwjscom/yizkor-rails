class CreateSubject < ActiveRecord::Migration
  def self.up
    create_table :subject_types do |t|
      t.string :title
      t.timestamps
    end
    SubjectType.create(:title => 'edu')
    create_table :subjects do |t|
      t.integer :book_id
      t.integer :subject_type_id
      t.timestamps
    end
    Subject.create(:book_id => 1, :subject_type_id => 1)
  end

  def self.down
    drop_table :subjects
    drop_table :subject_types
  end
end
