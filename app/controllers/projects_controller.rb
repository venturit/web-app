class ProjectsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:show, :index]
  load_and_authorize_resource :except => [:join,:leave,:contribute]
   
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.lead_id = current_user.id
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  # PUT /projects/1/join
  # PUT /projects/1/join.json
  def join
    @project = Project.find(params[:id]) 
    if @project.is_open?
      @collaboration = ProjectCollaborator.where(:project_id=>@project.id,:user_id=>current_user.id).first || ProjectCollaborator.create(:project_id=>@project.id,:user_id=>current_user.id)
      respond_to do |format|
      if @collaboration.valid?
        format.html { redirect_to @project, notice: 'You have successfully joined the project!' }
        format.json { head :no_content }
        else
          format.html { render action: "index" }
          format.json { render json: {error: "oops something went wrong!"}, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @project, error: 'Project is not open for collaborations!'}
        format.json { render json: {error: "oops project is not open for collaborations!"}, status: :unprocessable_entity }
      end
    end
  end
  # PUT /projects/1/leave
  # PUT /projects/1/leave.json
  def leave
    @project = Project.find(params[:id]) 
    @collaboration = ProjectCollaborator.where(:project_id=>@project.id,:user_id=>current_user.id).first
    if !@collaboration.blank?
      respond_to do |format|
         if  @collaboration.destroy
           format.html { redirect_to @project, notice: 'You have successfully left the project!' }
           format.json { head :no_content }
        else
          format.html { render action: "index" }
          format.json { render json: {error: "oops something went wrong!"}, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @project, error: 'Nothing to do, you are not a collaborator!'}
        format.json { render json: {error: "oops nothing to do, you are not a collaborator!"}, status: :unprocessable_entity }
      end
    end
  end
  
  # POST /projects/1/contribute.json
  def contribute
    @project = Project.find(params[:id]) 
    respond_to do |format|
      format.html { redirect_to @project, error: 'You have to contribute data through mobile app!'}
      format.json do
         project_datum = params[:project_datum] 
         project_datum[:user_id]= current_user.id
         @project.project_data.create(project_datum)
         # puts params
         render json: {notice: "You have successfully contributed the data!",:status =>:success}, status: :success
      end
    end
  end
  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
