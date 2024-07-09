class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def index
    render json: model_class.all
  end

  private

  def model_class
    controller_name.classify.constantize
  end
end
