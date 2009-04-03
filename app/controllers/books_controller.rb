class BooksController < ApplicationController

  def search
  end

  def find
    @book = Book.find_by_title(params['title'])

    if @book != nil
      render :action => 'show'
    else
      flash.now[:notice] = 'Book not found'
      render :action => 'search'
    end
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
end
