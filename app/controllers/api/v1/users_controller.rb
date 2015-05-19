class Api::V1::UsersController < Api::V1::BaseController
  protect_from_forgery with: :null_session

  before_filter :authenticate_user!, :except => [:create]

  respond_to :json

  def show
    render :status => :ok,
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
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :user => @user.errors}
    end
  end

  def update
    if User.update(current_user.id, user_params)
      render :status => :ok,
             :json => { :success => true,
                        :info => 'User updated',
                        :user => current_user}
    else
      render :status => :unprocessable_entity,
             :json => { :success => false
             }
    end
  end

  def destroy
    if User.find(current_user.id).destroy
      render :status => :ok,
             :json => { :success => true,
                        :info => 'User deleted'}
    else
      render :status => :unprocessable_entity,
             :json => { :success => false
             }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :lang, :country, :categories)
  end
end
