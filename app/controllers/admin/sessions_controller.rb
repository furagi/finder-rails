class Admin::SessionsController < ApplicationController

  before_action :require_user, only: [:destroy]

  # actions :new, :create, :destroy

  respond_to :html

  def new

  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to admin_path
    else
      flash[:alert] = 'Wrong email or password'
      redirect_to admin_login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_path
  end

  private
    def permitted_params
      {session: params.permit(:email, :password) }
    end
end
