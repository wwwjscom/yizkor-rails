class AlternateTitlesController < ApplicationController
  # GET /alternate_titles
  # GET /alternate_titles.xml
  def index
    @alternate_titles = AlternateTitle.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alternate_titles }
    end
  end

  # GET /alternate_titles/1
  # GET /alternate_titles/1.xml
  def show
    @alternate_title = AlternateTitle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alternate_title }
    end
  end

  # GET /alternate_titles/new
  # GET /alternate_titles/new.xml
  def new
    @book = Book.find(params[:book_id])
    @alternate_title = AlternateTitle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alternate_title }
    end
  end

  # GET /alternate_titles/1/edit
  def edit
    @alternate_title = AlternateTitle.find(params[:id])
  end

  # POST /alternate_titles
  # POST /alternate_titles.xml
  def create
    @alternate_title = AlternateTitle.new(params[:alternate_title])

    respond_to do |format|
      if @alternate_title.save
        flash[:success] = 'AlternateTitle was successfully created.'
        format.html { redirect_to(add_details_path) }
        format.xml  { render :xml => @alternate_title, :status => :created, :location => @alternate_title }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alternate_title.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /alternate_titles/1
  # PUT /alternate_titles/1.xml
  def update
    @alternate_title = AlternateTitle.find(params[:id])

    respond_to do |format|
      if @alternate_title.update_attributes(params[:alternate_title])
        flash[:success] = 'AlternateTitle was successfully updated.'
        format.html { redirect_to(@alternate_title) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alternate_title.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alternate_titles/1
  # DELETE /alternate_titles/1.xml
  def destroy
    @alternate_title = AlternateTitle.find(params[:id])
    @alternate_title.destroy

    respond_to do |format|
      format.html { redirect_to(alternate_titles_url) }
      format.xml  { head :ok }
    end
  end
end
