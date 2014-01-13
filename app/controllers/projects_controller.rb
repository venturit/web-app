class ProjectsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:show, :index]
  load_and_authorize_resource :except => [:join,:leave]
  respond_to :html

  # GET /projects 
  def index
    @projects = Project.all
    respond_with(@projects)
  end

  # GET /projects/1
  def show
    @project = Project.find(params[:id])
    respond_with(@project)
  end

  # GET /projects/new
  def new
    @project = Project.new
    3.times do
      @project.custom_fields.build
    end
    flash.keep
    respond_with(@project)
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    if @project.custom_fields.blank?
      3.times do
        @project.custom_fields.build
      end
    end
    flash.keep
    respond_with(@project)
  end

  # POST /projects
  def create
    @project = Project.new(params[:project])
    @project.lead_id = current_user.id
    if   @project.save
        flash[:notice] = "Project was successfully created." 
    else
        flash[:alert] = "Oops project data not complete. Please correct the errors."
    end
    respond_with(@project)
  end

  # PUT /projects/1
  def update
    @project = Project.find(params[:id])
    if  @project.update_attributes(params[:project])
      flash[:notice] = "Project was successfully updated." 
    else
      flash[:alert] = "Oops project data not complete. Please correct the errors."
    end
    respond_with(@project)
  end
  
  # PUT /projects/1/join
  def join
    @project = Project.find(params[:id]) 
    if @project.is_open?
      @collaboration = ProjectCollaborator.where(:project_id=>@project.id,:user_id=>current_user.id).first || ProjectCollaborator.create(:project_id=>@project.id,:user_id=>current_user.id)
      if @collaboration.valid?
        flash[:notice] = "You have successfully joined the project!"
      else
        flash[:alert] = "Oops something went wrong. You cannot join at this time."
      end
    else
      flash[:alert] = "Oops project is not open for contributions!"
    end
    respond_with(@project)
  end
  
  # PUT /projects/1/leave
  def leave
    @project = Project.find(params[:id]) 
    @collaboration = ProjectCollaborator.where(:project_id=>@project.id,:user_id=>current_user.id).first
    if @collaboration.blank?
       flash[:alert] = "Oops nothing to do. You are not a collaborator for this project!"
    else
      if  @collaboration.destroy
        flash[:notice] = "You have successfully left the project!"
      else
        flash[:alert] = "Oops something went wrong. You cannot leave  at this time."
      end
    end
    respond_with(@project)
  end

  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])
    flash[:notice] = "Project was successfully delete." if  @project.destroy
    respond_with(@project)
  end
end
