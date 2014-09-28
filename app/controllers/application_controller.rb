class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # layout
  layout :layout_by_resource
  def layout_by_resource
    if devise_controller?# && controller_name != "invitations"
      "devise"
    elsif @frontend
      "frontend"
    else
      "application"
    end
  end


  # current account
  before_filter :set_current_account
  def set_current_account
    @frontend = false

    # get account by subdomain | frontend
    if Account.where(subdomain: request.subdomain).empty? === false
      @current_account = Account.where(subdomain: request.subdomain).first
      @frontend = true
      return @current_account
    end


    # get account by scoped :account_id | backend
    if params[:account_id]
      @current_account = Account.find(params[:account_id])
      return @current_account
    end

    # redirect to the user account if there is no account id
    if current_user
      return redirect_to prism_root_path(current_user.account) unless controller_name == "sessions" && action_name == "create"
    end

    # dont' raise the exception if we are in the devise stuff
    if !devise_controller?
      raise ActionController::RoutingError.new('Account not found.')
    end
  end
end
