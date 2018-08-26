class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to user_path(user.id)
    else
      flash.now[:danger] = '残念！ログイン失敗！'
      render 'new'
    end
  end

end
