class SessionController < ApplicationController
  def new
    session[:previous_page] = URI(request.referer).path
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.role == 'admin'
        redirect_to users_path        
      elsif session[:previous_page].present?
        redirect_to session[:previous_page]
      else
        redirect_to posts_path
      end
    else
      flash[:error] = 'Invalid login'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
