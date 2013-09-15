class Api::V1::ProjectsController < ApplicationController
  load_and_authorize_resource 
  
  def index
     render json: Project.all 
  end

end
