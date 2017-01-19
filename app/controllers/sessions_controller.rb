class SessionsController < ApplicationController
  def getLogin
    render 'login'
  end

  def postLogin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login user
      flash[:success] = 'You have successfully logged in'
      redirect_to posts_path
    else
      flash[:failure] = 'There was a problem with your email or password'
      render 'login'
    end
  end

  def deleteLogout
    logout
    redirect_to home_path
  end
end
