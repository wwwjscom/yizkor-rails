class ContributorsController < ApplicationController
  # GET /contributors
  # GET /contributors.xml
  def index
    @contributors = Contributor.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contributors }
    end
  end

  # GET /contributors/1
  # GET /contributors/1.xml
  def show
    @contributor = Contributor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contributor }
    end
  end

  # GET /contributors/new
  # GET /contributors/new.xml
  def new
    @contributor = Contributor.new
    @book = Book.find(params[:book_id])
    @contributors = Contributor.find(:all, :conditions => ['book_id = ?', @book])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contributor }
    end
  end

  # GET /contributors/1/edit
  def edit
    @contributor = Contributor.find(params[:id])
  end

  # POST /contributors
  # POST /contributors.xml
  def create
    @contributor = Contributor.new(params[:contributor])

    respond_to do |format|
      if @contributor.save
        flash[:success] = 'Contributor was successfully created.'
        format.html { redirect_to add_details_path }
        format.xml  { render :xml => @contributor, :status => :created, :location => @contributor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contributor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contributors/1
  # PUT /contributors/1.xml
  def update
    @contributor = Contributor.find(params[:id])

    respond_to do |format|
      if @contributor.update_attributes(params[:contributor])
        flash[:success] = 'Contributor was successfully updated.'
        format.html { redirect_to(@contributor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contributor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contributors/1
  # DELETE /contributors/1.xml
  def destroy
    @contributor = Contributor.find(params[:id])
    @contributor.destroy

    respond_to do |format|
      format.html { redirect_to(contributors_url) }
      format.xml  { head :ok }
    end
  end
end
