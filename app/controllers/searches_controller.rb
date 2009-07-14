class SearchesController < ApplicationController

  auto_complete_for :book, :title

  def auto_complete_for_book_title
    @titles = ['tag1', 'tag2', 'tag3', 'abc', 'def', 'hkl']
    render :partial => 'title_list', :object => @titles
  end


  def set_tags
    respond_to do |format|
      format.html
      format.js do
        render :update do |page|
          page.replace_html('book_title_auto_complete', params[:title])
        end
      end
    end
  end


  def suggestions
  end

  def index
    @book = Book.new
  end

  def find_by_title
  end

  def search
    books = find(params[:book])

    begin
      if books.length > 1
        single = false
      end
    rescue
      single = true
    end

      if books.blank?
        flash[:notice] = 'Book not found'
        redirect_to "/searches"
      elsif not single
        @books = books
        render :partial => 'multi_results', :layout => 'application'
      else
        redirect_to :controller => 'books', :action => 'show', :id => books.id
      end
  end


  def search_old
    find_by = params[:find_by]

    unless params[:commit].blank?
      book = find_query(find_by)

    end
  end

  private #------------


  def find(book)
    b = Book.new
    q = ''


    # first search the one to one relationships
    
    book.each do |a, v|
      if a == "contributor" or a == 'language' or a == 'location'
        # ignore these one to many relationships till later
      elsif not v.blank? and v != '0'
        q += " AND " unless q.blank?
        q += " #{a} RLIKE '#{v}'"
      end
    end

    books = Book.find(:all, :conditions => q)


    # Now search the one to many relationships

    unless book[:contributor][:role].blank?
      books = b.match_contributor(books, book[:contributor]) 
    end

    lang_type = book[:language][:language].to_i
    if LanguageType::LANGUAGES.flatten.include?(lang_type)
      books = b.match_language(books, lang_type) 
    end

    loc = book[:location][:location].to_i
    if LocationType::LOCATIONS.flatten.include?(loc)
      books = b.match_location(books, loc) 
    end

    pop = book[:location][:population]
    unless pop.blank?
      books = b.match_population(books, pop) 
    end

    alternate_title = book[:title]
    unless alternate_title.blank?
      books = b.match_alternate_title(books, alternate_title) 
    end


    # all done here
    return books
  end



  def find_query(find_by)
    case find_by
      when 'title': 
        books = Book.find(:all, :conditions => ["title RLIKE '#{params[:title]}'"])

      when 'contributor': 
        books = Contributor.find(:all, 
                                 :conditions => 
                                ["first = ? AND last = ? AND role = ?", 
                                  params[:first], 
                                  params[:last], 
                                  params[:Role]
                                ])
        # bug here - we only return the first otherwise we'll need
        # to loop over all the results returned, which I didn't
        # write here.
        books = Book.find(:first, :conditions => ["id IN (?)", books.collect { |b| b.id }])

      when 'advanced':
        conditions = ""
        # build conditions according to info given
        params_list = ['publication_year', 'publication_place', 'call_num', 'abstract', 'keywords', 'other_notes', 'table_of_contents', 'has_toc', 'has_index', 'has_necrology']
        params_list.each do |param|
          unless params[param].blank?
            if conditions != ""
              conditions += " AND"
            end
            conditions += " #{param} = '#{params[param]}'"
          end
        end
        books = Book.find(:all, :conditions => ["#{conditions}"])

      when 'population':
        books = Location.find_by_population(params[:population])
      end
    return books
  end
end
