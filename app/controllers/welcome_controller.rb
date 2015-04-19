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

  # will contact user via ezText and ask quesitonaire
  def verify
    # get user phone
    phone = params[:phone]

    # build message
    options = {:subject => "Welcome to What'sHappening!", :phonenumber => "7406410248", :message => "We'd like to get you up and running but first we have 3 simple questions just reply via text\n1. What is your name?\n2. What is your zipcode?\n3. How old is your child?\n4. What is your child interested in? Reply with either 'Arts','Sports', or 'Volunteering'. You will be receiving event texts starting this weekend"}

    options = {:subject => "Welcome to What'sHappening!", :phonenumber => "7406410248", :message => "Test"}

    # send text
    Eztexting::Sms.single(options)

  end
end
