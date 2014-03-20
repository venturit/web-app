class Api::V1::ProjectsController < ApplicationController
  load_and_authorize_resource 
  after_filter :options 
  def index
     render json: Project.all 
  end

  def options
   headers['Access-Control-Allow-Origin'] = "*"
  end
end
