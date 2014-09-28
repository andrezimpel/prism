class Clients::ClientsController < ApplicationController
  before_action :authenticate_client!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :prism_uuid) }
  end
end
