class SessionsController < Devise::SessionsController
  def create
    resource = User.find_by(email: user_params[:email])
    resource = User.create!(user_params) unless resource
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    redirect_to root_path, notice: "Succeessfully Signin"
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    respond_to_on_destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end