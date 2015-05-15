class Api::V1::HomeController < ApplicationController

  def index
    render :status => 200,
           :json => { :success => true,
                      :info => 'Home'
           }

  end
end