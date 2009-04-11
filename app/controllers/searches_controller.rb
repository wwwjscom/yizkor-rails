class SearchesController < ApplicationController

  def index
  end

  def search
    book = search_query(params[:find_by])
    unless params[:commit].blank?
      if book.blank?
        flash.now[:notice] = 'Book not found'
        render :action => 'search_by_title'
      else
        redirect_to :controller => 'books', :action => 'show', :id => book.id
      end
    end
  end

  private #------------

  def search_query(find_by)
    case find_by
      when 'title': Book.find_by_title(params[:title])
    end
  end
end
