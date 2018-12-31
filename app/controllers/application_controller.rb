class ApplicationController < ActionController::Base


  before_action :set_count
  def set_count
    if user_signed_in?
      @order_count = Order.where("user_id = ?", current_user.id).count
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to "/login", alert: exception.message
  end


  before_action :configure_permitted_parameters, if:  :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
  end
