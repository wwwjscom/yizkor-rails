class CallNumsController < ApplicationController
  # GET /call_nums
  # GET /call_nums.xml
  def index
    @call_nums = CallNum.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @call_nums }
    end
  end

  # GET /call_nums/1
  # GET /call_nums/1.xml
  def show
    @call_num = CallNum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @call_num }
    end
  end

  # GET /call_nums/new
  # GET /call_nums/new.xml
  def new
    @call_num = CallNum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @call_num }
    end
  end

  # GET /call_nums/1/edit
  def edit
    @call_num = CallNum.find(params[:id])
  end

  # POST /call_nums
  # POST /call_nums.xml
  def create
    @call_num = CallNum.new(params[:call_num])

    respond_to do |format|
      if @call_num.save
        flash[:success] = 'Call number was successfully created.'
        format.html { redirect_to add_details_path }
        format.xml  { render :xml => @call_num, :status => :created, :location => @call_num }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @call_num.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /call_nums/1
  # PUT /call_nums/1.xml
  def update
    @call_num = CallNum.find(params[:id])

    respond_to do |format|
      if @call_num.update_attributes(params[:call_num])
        flash[:success] = 'Call number was successfully updated.'
        format.html { redirect_to(@call_num) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @call_num.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /call_nums/1
  # DELETE /call_nums/1.xml
  def destroy
    @call_num = CallNum.find(params[:id])
    @call_num.destroy

    respond_to do |format|
      format.html { redirect_to(call_nums_url) }
      format.xml  { head :ok }
    end
  end
end
