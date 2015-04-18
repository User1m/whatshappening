class WelcomeController < ApplicationController

  def create
    # @user = User.new(user_params)
    # if @user.save
    #   render("SAVED")
    # else
    #   render("welcome")
    # end
    render("test")
  end

  def index

  end

  def user_params
    params.requrie(:user).permit(:email, :phone)
  end
end
