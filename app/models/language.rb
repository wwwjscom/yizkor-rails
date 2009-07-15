class Language < ActiveRecord::Base
  belongs_to :language_type
  belongs_to :book
end
