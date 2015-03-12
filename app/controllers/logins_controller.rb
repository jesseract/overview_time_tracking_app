class LoginsController < ApplicationController

  def new
  end

  def create
    developer = Developer.find_by(email: params[:email])
    if developer && developer.authenticate(params[:password])
      make_session(developer)
      redirect_to projects_path
    else
      flash.now[:notice] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    #delete their session and redirect to login page
  end

  def logout
    session[:developer_id] = nil
    redirect_to new_login_path
  end

  def profile
    if session[:developer_id] == "developer"
      redirect_to edit_developer_path(session[:developer_id])
    else
      redirect_to root_path, notice: "Please log in to see this page."
    end
  end

  private def make_session(developer)
    session[:developer_id] = developer.id
  end


end
