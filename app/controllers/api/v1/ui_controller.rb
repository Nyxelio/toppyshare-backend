class Api::V1::UiController < Api::V1::BaseController
  respond_to :json

  before_action :set_locale

  def set_locale
    if current_user
      I18n.locale = current_user.lang || I18n.default_locale
    end
  end

  def get_all_categories
    respond_with I18n.t 'categories'
  end
end
