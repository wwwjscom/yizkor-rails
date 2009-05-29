class DigitizedLinksController < ApplicationController
  # GET /digitized_links
  # GET /digitized_links.xml
  def index
    @book = Book.find(params[:book_id])
    @digitized_links = @book.digitized_link

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @digitized_links }
    end
  end

  # GET /digitized_links/1
  # GET /digitized_links/1.xml
  def show
    @digitized_link = DigitizedLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @digitized_link }
    end
  end

  # GET /digitized_links/new
  # GET /digitized_links/new.xml
  def new
    @digitized_link = DigitizedLink.new
    @book = Book.find(params[:book_id])
    @digitized_links = @book.digitized_link

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @digitized_link }
    end
  end

  # GET /digitized_links/1/edit
  def edit
    @digitized_link = DigitizedLink.find(params[:id])
  end

  # POST /digitized_links
  # POST /digitized_links.xml
  def create
    @digitized_link = DigitizedLink.new(params[:digitized_link])

    respond_to do |format|
      if @digitized_link.save
        flash[:success] = 'Digitized Link was successfully created.'
        format.html { redirect_to add_details_path }
        format.xml  { render :xml => @digitized_link, :status => :created, :location => @digitized_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @digitized_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /digitized_links/1
  # PUT /digitized_links/1.xml
  def update
    @digitized_link = DigitizedLink.find(params[:id])

    respond_to do |format|
      if @digitized_link.update_attributes(params[:digitized_link])
        flash[:notice] = 'DigitizedLink was successfully updated.'
        format.html { redirect_to(@digitized_link) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @digitized_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /digitized_links/1
  # DELETE /digitized_links/1.xml
  def destroy
    @digitized_link = DigitizedLink.find(params[:id])
    @digitized_link.destroy

    flash[:success] = 'Link deleted.'
    respond_to do |format|
      format.html { redirect_to(add_details_path) }
      format.xml  { head :ok }
    end
  end
end
