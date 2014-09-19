class Backend::UsersController < ApplicationController
  def update_settings
    user = current_user
    user.settings(params[:resource].to_sym).update_attributes! params[:key].to_sym => params[:value]

    redirect_to root_path
  end
end
