class Backend::BackendController < ApplicationController
  before_action :authenticate_user!

  @title = "hi"

  # default url options
  def default_url_options(options={})
    if @current_account.present?
      { :account_id => @current_account.id }
    else
      { :account_id => nil }
    end
  end
end
