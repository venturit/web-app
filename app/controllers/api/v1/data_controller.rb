class Api::V1::DataController < ApplicationController
  load_and_authorize_resource
  
  def create
    @project = Project.find(params[:project_id]) 
    # TODO: allow only contributions from contributors, for now leaving project contributions open
    respond_to do |format|
      format.html { redirect_to @project, error: 'You have to contribute data through mobile app!'}
      format.json do
         datum = params[:datum] 
         datum[:user_id]= current_user.id
         @project.data.create(datum)
         render json: {notice: "You have successfully contributed the data!",:status =>:success,:id=>@project.data.last.id}, status: :success
      end
    end
  end
  
end
