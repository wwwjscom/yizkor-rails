class LanguageType < ActiveRecord::Base
  has_many :language
  #LANGUAGES = LanguageType.find(:all).collect { |l| [l.title, l.id] }
  LANGUAGES = ['Fix the language model', 1]
end
