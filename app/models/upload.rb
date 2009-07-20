class Upload < ActiveRecord::Base

  belongs_to :book
  attr_accessible :book_id, :upload_type
  
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 500.kilobytes,
                 :resize_to => '520x400>',
                 :thumbnails => { :thumb => '100x100>' },
                 :processor => 'ImageScience'

  validates_as_attachment

end
