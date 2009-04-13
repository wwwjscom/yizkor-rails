class AdminsController < ApplicationController

  before_filter :authorized, :except => [:index]

  def index
    already_admin?

    unless params[:commit].blank?
      u = params[:username]
      p = params[:password]
      if u == 'admin' and p == 'admin'
        session[:admin] = true
        flash[:notice] = 'Logged in'
        redirect_to books_path
      else
        flash[:notice] = "Please login"
      end
    end
  end

  def show
  end

  def logout
    session[:admin] = nil
    flash[:notice] = 'Logged out'
    redirect_to :action => 'index'
  end


  private #---------------

  def authorized
    if session[:admin].blank?
      flash[:notice] = "Please login"
      redirect_to :action => 'index'
    end
  end

  def already_admin?
    unless session[:admin].blank?
      redirect_to books_path
    end
  end

end
