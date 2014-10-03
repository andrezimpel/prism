class AccountsController < ApplicationController
  # before_action :set_account, only: [:show, :edit, :update, :destroy]
  skip_filter :authenticate_user!, :set_current_account, only: [:new, :create]
  layout "devise", only: [:new, :create]

  # GET /accounts/new
  def new
    @account = Account.new
    @account.users.build

    if current_user
      redirect_to prism_root_path(current_user.account_id)
    end
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save

        # sign in user
        user = @account.users.first
        sign_in(:user, user)
        @account.update_attributes(user_id: user.id)

        format.html { redirect_to prism_root_path(@account), notice: 'Welcome to Satiisfy!' }
        format.json { render action: 'show', status: :created, location: @account }
      else
        format.html { render action: 'new' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:title, :subdomain, :user_id, users_attributes: [:email, :password, :password_confirmation, :firstname, :lastname])
    end

    def user_params
      params[:account].require(:users_attributes).permit(:email, :password, :password_confirmation, :firstname, :lastname)
    end
end
