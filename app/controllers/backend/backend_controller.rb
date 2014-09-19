class Backend::BackendController < ApplicationController
  before_action :authenticate_user!

  @title = "hi"
end
