class Backend::BackendController < ApplicationController
  before_action :authenticate_user!

  # store user login info in cookie for fast-login  & redirect after login
  def after_sign_in_path_for(resource)
    if resource.class.name.downcase == "client"
      prism_root_path(current_client.account)
    else
      prism_root_path(current_user.account)
    end
  end

  

  # default url options
  def default_url_options(options={})
    if @current_account.present?
      { :account_id => @current_account.id }
    else
      { :account_id => nil }
    end
  end
end
