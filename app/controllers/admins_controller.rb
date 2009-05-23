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

  def keywords
  end


  private #---------------

  def already_admin?
    unless session[:admin].blank?
      redirect_to books_path
    end
  end

end
