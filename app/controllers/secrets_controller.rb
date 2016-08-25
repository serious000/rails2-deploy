class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
    @secret = Secret.all
  end

  def new
  end

  def create
    @secret = Secret.new(content: params[:content], user: current_user)
    if @secret.save
      flash['success'] = "New Secret"
      redirect_to :back
    # redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @secret.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    secret = Secret.find(params[:id])
    secret.destroy if secret.user == current_user
    # @user = User.find(params[:id])
    # redirect_to "/users/#{@user.id}"
    redirect_to "/users/#{current_user.id}"
  end
end
