class LoginsController < ApplicationController
  def login
    if request.post?
      developer = Developer.find_by_email(params[:email])

      if developer && developer.authenticate(params[:password]) #check to make sure that teacher != nil
        session[:developer_id] = developer.id
        flash[:notice] = "Welcome!" #flash persists after a redirect
        redirect_to logins_path #probably need to change this later
      else
        flash.now[:notice] = "Please re-enter credentials" #flash.now does not hang out after a redirect
      end
    end
  end

  def logout
    session[:developer_id] = nil
    redirect_to login_login_path
  end

  def change_password
    if request.post?
      if session[:developer_id]
        developer = Developer.find_by_id(session[:developer_id])
        if developer && developer.authenticate(params[:old_password]) #check to make sure that developer != nil
          Developer.update(session[:developer_id], :password => params[:new_password])
          redirect_to logins_path #probably needs to be changed later
        else
          flash.now[:notice] = "Please double check your old password" #flash.now does not hang out after a redirect
        end
      end
    end
  end

  def register
    session[:developer_id] = nil
    redirect_to login_register_path
  end
end
