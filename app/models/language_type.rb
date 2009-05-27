class LanguageType < ActiveRecord::Base
  has_many :language
  LANGUAGES = LanguageType.find(:all).collect { |l| [l.title, l.id] }
end
