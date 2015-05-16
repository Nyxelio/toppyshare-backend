class Api::V1::Authentication::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session

  before_filter :verify_signed_out_user, :except=>[:destroy]

  def create
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => { :success => true,
                      :info => 'Logged in',
                      :user => current_user}
  end

  def destroy
    #warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    #current_user.update_column(:authentication_token, nil)

    sign_out
    render :status => 200,
           :json => { :success => true,
                      :info => 'Logged out'
           }
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => 'Login Credentials Failed'
           }
  end

end
