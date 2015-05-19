class Api::V1::FollowersController < Api::V1::BaseController

  protect_from_forgery with: :null_session

  before_filter :authenticate_user!

  respond_to :json

  # GET /followers
  def index

    if params[:user_id]
      @followers = User.find(params[:user_id]).followers unless nil?
    else
      @followers = User.find(current_user.id).followers unless nil?
    end

    respond_with @followers

  end

  private

  def follower_params
    # params.require(:user).permit(:user_id)
    params.require(:user).permit(:user_id)
  end

end
