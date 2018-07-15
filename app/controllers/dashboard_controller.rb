class DashboardController < ActionController::Base
	include ActionController::HttpAuthentication::Token::ControllerMethods
  include ::ActionController::Serialization

  before_action :set_headers, :authenticate, except: [:login]

  def set_headers
    headers['Access-Control-Allow-Origin'] = "*"
    headers['Access-Control-Allow-Credentials'] = "true"
  end

  protected
  def authenticate
    status, message = authenticate_token
    unless status
      render json: {status: false, message: message}, status: 401
    end  
  end

  def authenticate_token
  	@current_app_user = User.get_user_from_token request.headers['HTTP_AUTHORIZATION']
    return false, "Please login again to continue" if @current_app_user.blank?
    if @current_app_user 
      return true, ""
    else
      return false, "Your account has been disabled"
    end  
  end

end