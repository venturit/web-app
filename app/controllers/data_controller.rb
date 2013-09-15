class DataController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:show]
 
  # GET /projects/1
  def show
    @project = Project.find(params[:project_id]) 
    unless params[:id].blank?
       @data = @project.data.where(:id=>params[:id])
    end 
    respond_to do |format|
      format.html # show.html.erb
    end
  end

end