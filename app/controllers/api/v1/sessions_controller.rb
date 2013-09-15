class Api::V1::SessionsController < Devise::SessionsController
    respond_to :json
    def create  
        resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
        sign_in(resource_name, resource) 
        render json: {auth_token: resource.authentication_token, email: resource.email, bio: resource.bio, name: resource.name}
       end

      def failure
        warden.custom_failure!
        render json: {message: "Your email and password do not match."}, status: 401
      end
       
end
