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
    username = session['cas']['user']
    @current_user ||= User.find_by_username( username ) if username
    if @current_user == nil && username.length
      @current_user = User.create( username: username )
    end
    @current_user
  end

  helper_method :current_user 

end
