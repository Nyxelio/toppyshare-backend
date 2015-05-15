class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  # Sign in using token should not be tracked by Devise trackable
  # See https://github.com/plataformatec/devise/issues/953
  def skip_trackable
    request.env['devise.skip_trackable'] = true
  end
end
