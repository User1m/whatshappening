class WelcomeController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to success_path

      unless @user.phone_no.nil?
        Eztexting.connect!(ENV['EZUSERNAME'], ENV['EZPASSWORD'])

        options = {
          phonenumber: @user.phone_no,
          message: "Welcome to What's Happening! Here are two events that are happening soon!"
        }

        Eztexting::Sms.single(options)
      end
    else
      redirect_to root_path
    end
  end

  def index
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :phone_no)
  end
end
