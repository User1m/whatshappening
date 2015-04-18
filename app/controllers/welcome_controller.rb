class WelcomeController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def index
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:email, :phone_no)
  end
end
