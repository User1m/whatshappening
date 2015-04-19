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

        body = "Welcome to What's Happening! " +
          "Messaging and Data rates may apply.\n" +
          "Here are some events that are happening soon!\n\n"

        Event.last_three.each do |event|
          body = body + event.to_string + "\n\n"
        end

        body = body + "Powered by GiveBackHack.\nhttp://givebackhack.com/"

        @client.messages.create(
          from: ENV['TWILIOPHONE'],
          to: @user.phone_no,
          body: body
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
