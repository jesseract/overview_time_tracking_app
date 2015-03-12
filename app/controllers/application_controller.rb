class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user
    if session[:developer_id]== nil
        redirect_to new_login_path, notice: "You must log in to see that page"
      return false
    end
  end

end
