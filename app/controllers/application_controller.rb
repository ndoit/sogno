class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate

  def authenticate
  	
  	if ( !request.session.has_key?("cas") )
  		puts "rendering 401"
  		render status: 401, text: ""
	end
  end


  def current_user
    @current_user ||= session['cas']['user'] #&& User.find_by_id(session[:current_user_id]) # Use find_by_id to get nil instead of an error if user doesn't exist
  end

  helper_method :current_user 

end
