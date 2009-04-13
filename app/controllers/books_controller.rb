class BooksController < ApplicationController

  before_filter :authorized, :except => [:index, :show]

  def search
  end

  def find
  end

  # GET /books
  # GET /books.xml
  def index
    @books = Book.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(@book) }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        flash[:notice] = 'Book was successfully updated.'
        format.html { redirect_to(@book) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end

  def add_details
    @book = Book.find(params[:id])
    @alt_title = AltTitle.new
    @call_num = CallNum.new
    @page = Page.new
    @contributor = Contributor.new
    @subject = Subject.new
    @language = Language.new
    @location = Location.new
    @location_variation = LocationVariation.new
    @upload = Upload.new
    @images = Upload.find(:all, :conditions => ["book_id = ?", params[:id]])
  end

  def add_alt_title
    @alt_title = AltTitle.new(params[:alt_title])
    if @alt_title.save
      flash[:notice] = 'Title added!'
      redirect_to add_details_path
    else
      flash[:warning] = 'Error'
      render add_details_path
    end
  end

  def add_call_num
    @call_num = CallNum.new(params[:call_num])
    if @call_num.save
      flash[:success] = 'Call number added'
      redirect_to add_details_path
    else
      flash[:warning] = 'Unable to add call number'
      render add_details_path
    end
  end

  def add_page
    @page = Page.new(params[:page])
    if @page.save
      flash[:success] = 'Page added'
      redirect_to add_details_path
    else
      flash[:warning] = 'Unable to add page'
      render add_details_path
    end
  end

  def add_contributor
    @contributor = Contributor.new(params[:contributor])
    if @contributor.save
      flash[:success] = 'Contributor added'
      redirect_to add_details_path
    else
      flash[:warning] = 'Unable to add contributor'
      render add_details_path
    end
  end

  def add_subject
    @subject = Subject.new(params[:subject])
    if @subject.save
      flash[:success] = 'Subject added'
      redirect_to add_details_path
    else
      flash[:warning] = 'Unable to add subject'
      render add_details_path
    end
  end

  def add_language
    @language = Language.new(params[:language])
    if @language.save
      flash[:success] = 'Language added'
      redirect_to add_details_path
    else
      flash[:warning] = 'Unable to add language'
      render add_details_path
    end
  end

  def add_location
    @location = Location.new(params[:location])
    if @location.save
      flash[:success] = 'Location added'
      redirect_to add_details_path
    else
      flash[:warning] = 'Unable to add location'
      render add_details_path
    end
  end

  def add_location_variation
    @location_variation = LocationVariation.new(params[:location_variation])
    if @location_variation.save
      flash[:success] = 'Location variation added'
      redirect_to add_details_path
    else
      flash[:warning] = 'Unable to add location variation'
      render add_details_path
    end
  end

  def add_upload
    @upload = Upload.new(params[:upload])
    if @upload.save
      flash[:notice] = 'Upload was successfully created.'
      redirect_to add_details_path
    else
      render add_details_path
    end
  end

  def delete_upload
    if Upload.destroy(params[:book_id])
      flash[:notice] = 'File deleted'
    else
      flash[:error] = 'Error deleting file'
    end
    redirect_to add_details_path
  end

end
