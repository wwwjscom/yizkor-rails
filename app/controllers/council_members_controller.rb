class CouncilMembersController < ApplicationController
  # GET /council_members
  # GET /council_members.xml
  def index
    @council_members = CouncilMember.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @council_members }
    end
  end

  # GET /council_members/1
  # GET /council_members/1.xml
  def show
    @council_member = CouncilMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @council_member }
    end
  end

  # GET /council_members/new
  # GET /council_members/new.xml
  def new
    @council_member = CouncilMember.new
    @book = Book.find(params[:book_id])
    @council_members = CouncilMember.find(:all, :conditions => ['book_id = ?', @book])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @council_member }
    end
  end

  # GET /council_members/1/edit
  def edit
    @book = Book.find(params[:book_id])
    @council_member = CouncilMember.find(params[:id])
  end

  # POST /council_members
  # POST /council_members.xml
  def create
    @council_member = CouncilMember.new(params[:council_member])

    respond_to do |format|
      if @council_member.save
        flash[:success] = 'Council Member was successfully created.'
        format.html { redirect_to(add_details_path) }
        format.xml  { render :xml => @council_member, :status => :created, :location => @council_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @council_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /council_members/1
  # PUT /council_members/1.xml
  def update
    @council_member = CouncilMember.find(params[:id])

    respond_to do |format|
      if @council_member.update_attributes(params[:council_member])
        flash[:success] = 'Council Member was successfully updated.'
        format.html { redirect_to(add_details_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @council_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /council_members/1
  # DELETE /council_members/1.xml
  def destroy
    @council_member = CouncilMember.find(params[:id])
    @council_member.destroy

    flash[:success] = 'Council Member was successfully deleted.'

    respond_to do |format|
      format.html { redirect_to(add_details_path) }
      format.xml  { head :ok }
    end
  end
end
