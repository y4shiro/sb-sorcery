class UserSessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:username], params[:password], params[:remember])
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    remember_me!
    forget_me!
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
