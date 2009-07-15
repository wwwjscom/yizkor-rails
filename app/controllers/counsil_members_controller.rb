class CounsilMembersController < ApplicationController
  # GET /counsil_members
  # GET /counsil_members.xml
  def index
    @counsil_members = CounsilMember.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @counsil_members }
    end
  end

  # GET /counsil_members/1
  # GET /counsil_members/1.xml
  def show
    @counsil_member = CounsilMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @counsil_member }
    end
  end

  # GET /counsil_members/new
  # GET /counsil_members/new.xml
  def new
    @counsil_member = CounsilMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @counsil_member }
    end
  end

  # GET /counsil_members/1/edit
  def edit
    @counsil_member = CounsilMember.find(params[:id])
  end

  # POST /counsil_members
  # POST /counsil_members.xml
  def create
    @counsil_member = CounsilMember.new(params[:counsil_member])

    respond_to do |format|
      if @counsil_member.save
        flash[:notice] = 'CounsilMember was successfully created.'
        format.html { redirect_to(@counsil_member) }
        format.xml  { render :xml => @counsil_member, :status => :created, :location => @counsil_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @counsil_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /counsil_members/1
  # PUT /counsil_members/1.xml
  def update
    @counsil_member = CounsilMember.find(params[:id])

    respond_to do |format|
      if @counsil_member.update_attributes(params[:counsil_member])
        flash[:notice] = 'CounsilMember was successfully updated.'
        format.html { redirect_to(@counsil_member) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @counsil_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /counsil_members/1
  # DELETE /counsil_members/1.xml
  def destroy
    @counsil_member = CounsilMember.find(params[:id])
    @counsil_member.destroy

    respond_to do |format|
      format.html { redirect_to(counsil_members_url) }
      format.xml  { head :ok }
    end
  end
end
