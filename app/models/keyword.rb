class Keyword < ActiveRecord::Base
  belongs_to :keyword_type
  belongs_to :book

  def title
    KeywordType.find(self.title_id).title
  end
end
