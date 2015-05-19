class Api::V1::FollowingsController < Api::V1::BaseController

  protect_from_forgery with: :null_session

  before_filter :authenticate_user!

  respond_to :json

  # GET /followings
  def index

    if params[:user_id]
      @followings = User.find(params[:user_id]).followings unless nil?
    else
      @followings = User.find(current_user.id).followings unless nil?
    end
  end

  def create

   user = User.find(params[:user][:id])
   user.followings << current_user

   if user.save
     respond_with current_user, :location => api_users_path
   else
     respond_with user.errors, :location => api_users_path
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

  def follower_params
    params.require(:user).permit(:user_id)
  end

end
