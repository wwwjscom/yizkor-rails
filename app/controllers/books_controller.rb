class BooksController < ApplicationController

  before_filter :authorized, :only => [:destroy, :reject, :edit, :update, :approve]

  def search
  end

  def find
  end

  # GET /books
  # GET /books.xml
  def index
    @admin = admin?
    @books = Book.new.approved
    @pending = Book.new.pending

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

  # DELETE /books/1/reject
  def reject
    Book.delete(params[:id])
    flash[:success] = 'Book rejected'
    redirect_to books_path
  end

  # PUT /books/1/approve
  def approve
    Book.update(params[:id], { :approved => true})
    flash[:success] = 'Book approved'
    redirect_to books_path
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])

    #@book['approved'] = 1 if admin?

    if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to :action => 'add_details', :id => @book.id
    else
      render :action => "new"
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        flash[:success] = 'Book was successfully updated.'
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
    Book.update(params[:id], { :deleted => true} )

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end

  def add_details
    @book = Book.find(params[:book_id])
  end

  def create_details
    @alt_title = AltTitle.new
    @call_num = CallNum.new
    @page = Page.new
    @contributor = Contributor.new
    @subject = Subject.new
    @language = Language.new
    @location = Location.new
    @location_variation = LocationVariation.new
    @council_member = CouncilMember.new
    @keyword = Keyword.new
  end

  def add_alt_title
    @alt_title = AltTitle.new(params[:alt_title])
    if @alt_title.save
      flash[:success] = 'Title added!'
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

    if not params[:create_subject].blank?
      s_type = SubjectType.new 
      s_type.title = params[:create_subject]
      s_type.save
      @subject.subject_type_id = s_type.id
    end

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

  def add_council_member
    @council_member = CouncilMember.new(params[:council_member])
    if @council_member.save
      flash[:success] = 'Council Member was successfully created.'
      redirect_to add_details_path
    else
      render add_details_path
    end
  end

  def add_keyword
    @keyword = Keyword.new(params[:keyword])
    if @keyword.save
      flash[:success] = 'Keyword added.'
    else
      flash[:warning] = 'Error adding keyword.'
    end
    redirect_to add_details_path
  end

end
