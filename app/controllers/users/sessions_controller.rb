class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  respond_to :json
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    respond_to  do |format|
      format.html do
        super
      end
      format.json do
      warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
        render :status => 200,
          :json => { 
            :success => true,
            :info => "Logged in"
          }
      end
    end
    # super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
  def failure
    render :status => 401,
           :json => {
             :success => false,
             :info => "Login Failed",
             :data => {} }
  end
end
