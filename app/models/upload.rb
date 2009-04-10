class Upload < ActiveRecord::Base

  attr_accessible :book_id
  
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 500.kilobytes,
                 :resize_to => '320x200>',
                 :thumbnails => { :thumb => '100x100>' },
                 :processor => 'ImageScience'

  validates_as_attachment

end
