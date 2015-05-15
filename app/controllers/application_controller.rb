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

end
