class Api::V1::HomeController < Api::V1::BaseController

  def index
    render :status => 200,
           :json => { :success => true,
                      :info => 'Home'
           }

  end
end