class WelcomeController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to success_path

      unless @user.phone_no.nil?
        @client = Twilio::REST::Client.new ENV['TWILIOSID'], ENV['TWILIOTOKEN']

        @client.messages.create(
          from: ENV['TWILIOPHONE'],
          to: @user.phone_no,
          body: "Welcome to What's Happening! Here are two events that are happening soon!"
        )
      end
    else
      redirect_to success_path, notice: "There was an error. Please try again."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :phone_no)
  end
end
