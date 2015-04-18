class WelcomeController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      redirect_to root_path
    end
     # redirect_to(:action => "test", :email => params[:email], :phone => params[:phone])
    # redirect_to(:action => "verify", :email =>params[:email], :phone => params[:phone])

  end

  def index
    @user = User.new
  end

  def test
    @email = params[:email]
    @phone = params[:phone]
  end

  def user_params
    params.require(:user).permit(:email, :phone_no)
  end

  private
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
