class SearchesController < ApplicationController

  def index
  end

  def find_by_title
  end

  def search
    find_by = params[:find_by]
    book = find_query(find_by)
    unless params[:commit].blank?
      if book.blank?
        flash.now[:notice] = 'Book not found'
        #render :action => "find_by_#{find_by}"
        render :action => "search", :find_by => find_by
      else
        redirect_to :controller => 'books', :action => 'show', :id => book.id
      end
    end
  end

  private #------------

  def find_query(find_by)
    case find_by
      when 'title': Book.find_by_title(params[:title])
    end
  end
end
