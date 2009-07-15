class Keyword < ActiveRecord::Base
  belongs_to :keyword_type
  belongs_to :book
end
