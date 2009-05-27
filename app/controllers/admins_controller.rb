class AdminsController < ApplicationController

  before_filter :authorized, :except => [:index, :status]

  def index
    already_admin?

    unless params[:commit].blank?
      u = params[:username]
      p = params[:password]
      if u == 'admin' and p == 'admin'
        session[:admin] = true
        flash[:success] = 'Logged in'
        redirect_to books_path
      else
        flash[:warning] = "Incorrect login"
      end
    end
  end

  def status
  end

  def show
  end

  def logout
    session[:admin] = nil
    flash[:notice] = 'Logged out'
    redirect_to :action => 'index'
  end


  # admins/keywords
  def keywords
    c = params[:commit]

    if c == 'Add'

      k = KeywordType.new(params[:keyword_type])
      if k.save
        flash[:success] = 'Keyword added'
      else
        flash[:error] = "Couldn't save keyword"
      end

    elsif c == 'Delete'

      if KeywordType.delete(params[:keyword_type][:id])
        flash[:success] = 'Keyword deleted'
      else
        flash[:error] = "Couldn't delete keyword"
      end

    end

    @keyword_type = KeywordType.new
    @all_k = KeywordType.find(:all).collect { |k| [k.title, k.id] }
  end



  # admins/locations
  def locations
    c = params[:commit]

    if c == 'Add'

      k = LocationType.new(params[:location_type])
      if k.save
        flash[:success] = 'Location added'
      else
        flash[:error] = "Couldn't save location"
      end

    elsif c == 'Delete'

      if LocationType.delete(params[:location_type][:id])
        flash[:success] = 'Location deleted'
      else
        flash[:error] = "Couldn't delete location"
      end

    end

    @location_type = LocationType.new
    @all_k = LocationType.find(:all).collect { |k| [k.name, k.id] }
  end

  private #---------------

  def already_admin?
    unless session[:admin].blank?
      redirect_to books_path
    end
  end

end
