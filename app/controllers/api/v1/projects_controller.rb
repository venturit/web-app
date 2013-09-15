class Api::V1::ProjectsController < ApplicationController
  load_and_authorize_resource 
  
  def index
     render json: current_user.all_projects 
  end

end
