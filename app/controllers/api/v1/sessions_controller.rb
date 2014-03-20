class Api::V1::SessionsController < Devise::SessionsController
   #load_resource :only=> :destroy
    respond_to :json
    after_filter :options
      def create
        resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
        sign_in(resource_name, resource)
        resource.reset_authentication_token!
        render json: {auth_token: resource.authentication_token, email: resource.email, bio: resource.bio, name: resource.name}
      end

      def destroy
        user = User.find_by_authentication_token(params[:auth_token])
        sign_out(user)
        user.reset_authentication_token!
        render json: {message: 'Success!'}
        rescue Exception => e
          render json: {message: 'Errored!'}
      end

      def failure
        warden.custom_failure!
        render json: {message: "Your email and password do not match."}, status: 401
      end
      
      def options
        headers['Access-Control-Allow-Origin'] = "*"
      end
end
