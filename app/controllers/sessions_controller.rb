class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to welcome_path
    end
  end

  def create
      @user = User.find_by(name: params[:user][:name])
      password = params[:user][:password]
      if @user.try(:authenticate, password)
        session[:user_id] = @user.id
      else
        redirect_to login_path
      end
  end

  def destroy
    session.delete if session[:user_id]
  end
end
