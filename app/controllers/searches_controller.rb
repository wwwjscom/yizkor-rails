class SearchesController < ApplicationController

  def index
  end

  def find_by_title
  end

  def search
    find_by = params[:find_by]
    unless params[:commit].blank?
      book = find_query(find_by)
      if book.blank?
        flash[:notice] = 'Book not found'
        redirect_to "/searches/search?find_by=#{find_by}"
      else
        redirect_to :controller => 'books', :action => 'show', :id => book.id
      end
    end
  end

  private #------------

  def find_query(find_by)
    case find_by
      when 'title': books = Book.find_by_title(params[:title])

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
        params_list = ['historical_period', 'call_num', 'abstract', 'keywords', 'other_notes', 'table_of_contents', 'has_toc', 'has_index', 'has_necrology']
        params_list.each do |param|
          unless params[param].blank?
            if conditions != ""
              conditions += " AND"
            end
            conditions += " #{param} = #{params[param]}"
          end
        end
        books = Book.find(:first, :conditions => ["#{conditions}"])
      end
    return books
  end
end
