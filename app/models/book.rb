class Book < ActiveRecord::Base
  has_many :alt_title
  has_many :call_num
  has_many :upload
  has_many :subject
  has_many :page
  has_many :contributor
  has_many :language
  has_many :location
  has_many :digitized_link
  has_many :council_member
  has_many :keyword

  def approved
    Book.find(:all, :conditions => ["approved = true AND deleted = false"])
  end

  def pending
    Book.find(:all, :conditions => ["approved = false AND deleted = false"])
  end

  def keywords
    a = Array.new
    self.keyword.each do |k|
      a.push(KeywordType.find(k.keyword_type_id))
    end
    a.collect { |k| "#{k.title}, " }
  end

  def subjects
    subjects = Array.new
    self.subject.each do |s|
      subjects.push(SubjectType.find(s.subject_type_id))
    end
    subjects.collect { |s| "#{s.title}, " }
  end

  def pages
    self.page.collect { |s| "#{s.page}, " }
  end

  def contributors
    self.contributor.collect { |c| "#{c.first} #{c.last} - #{c.role}, " }
  end

  def languages
    languages = Array.new
    self.language.each do |s|
      languages.push(LanguageType.find(s.language_type_id))
    end
    languages.collect { |s| "#{s.title}, " }
  end

  def locations
    self.location.collect { |l| "#{l.name}, " }
  end

end
