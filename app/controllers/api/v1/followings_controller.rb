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

    respond_with @followings

  end

  def create

    current_user.followings << User.find(params[:user][:id])

   if current_user.save
     respond_with current_user, :location => api_users_path, include: :followings
   else
     respond_with user.errors, :location => api_users_path
   end
  end

  def update

  end

  def destroy

  end

  private

  def following_params
    params.require(:user).permit(:user_id)
  end

end
