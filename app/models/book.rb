class Book < ActiveRecord::Base
  has_many :alternate_title
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
      a.push(KeywordType.find(k.title_id))
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


  def match_contributor(books, contributor)
    final = []
    f = contributor[:first]
    l = contributor[:last]
    r = contributor[:role]

    books.each do |b| 
      blank = b.contributor.find(:first, :conditions => ["first = ? AND last = ? AND role = ?", f, l, r]).blank?
      final.push(b) if not blank
    end 

    final & books
  end


  def match_language(books, lang_type)
    final = []

    books.each do |b| 
      blank = b.language.find(:first, :conditions => ["language_type_id = ?", lang_type]).blank?
      final.push(b) if not blank
    end 

    final & books
  end


  def match_location(books, loc)
    final = []

    books.each do |b| 
      blank = b.location.find(:first, :conditions => ["location_type_id = ?", loc]).blank?
      final.push(b) if not blank
    end 

    final & books
  end


  # This method is different from the others because they may not be found
  # by simply searching for the main title.  Thus, we must also search the
  # alternate titles table for matches.
  def match_alternate_title(books, title)
    final = []

    matches = AlternateTitle.find(:all, :conditions => ["title = ?", title])
    #if matches.size == 1
    #  final.push(matches.book)
    #else
      matches.each do |b|
        final << b.book
      end
    #end

    logger.info "!!!!: #{books}"
    logger.info "!!!!: #{final}"
    logger.info "!!!!: #{final + books}"
    final + books
  end


  def match_population(books, pop)
    final = []

    books.each do |b| 
      blank = true
      b.location.each do |l|
        begin
          blank = LocationType.find(l.location_type_id, :conditions => ["population = ?", pop]).blank?
        rescue
          blank = true
        end
        break if not blank
      end
      final.push(b) if not blank
    end 

    final & books
  end

end
