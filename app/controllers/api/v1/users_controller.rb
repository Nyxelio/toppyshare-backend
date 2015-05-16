class Api::V1::UsersController < Api::V1::BaseController
  protect_from_forgery with: :null_session

  before_filter :authenticate_user!, :except => [:create]

  respond_to :json

  def show
    render :status => 200,
           :json => { :success => true,
                      :info => 'Current User',
                      :user => current_user}

  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      sign_in(@user)
      respond_with @user, :location => api_users_path
    else
      respond_with @user.errors, :location => api_users_path
    end
  end

  def update
    respond_with :api, User.update(current_user.id, user_params)
  end

  def destroy
    respond_with :api, User.find(current_user.id).destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :lang, :country, :categories)
  end
end
