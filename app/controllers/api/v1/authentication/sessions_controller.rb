class Api::V1::Authentication::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session

  def create
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => :created,
           :json => { :success => true,
                      :info => 'Logged in',
                      :user => current_user}
  end

  def destroy

    #FIXME
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    current_user.update_column(:authentication_token, nil)

    sign_out
    render :status => :ok,
           :json => { :success => true,
                      :info => 'Logged out'
           }
  end

  def failure
    render :status => :unauthorized,
           :json => { :success => false,
                      :info => 'Login Credentials Failed'
           }
  end

end
