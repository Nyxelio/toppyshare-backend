class Api::V1::HomeController < Api::V1::BaseController

  def index
    render :status => :ok,
           :json => { :success => true,
                      :info => 'Starter page for ToppyShare API'
           }

  end
end