class User < ActiveRecord::Base
  validates :email, email: true, allow_blank: true
  validates :zipcode, :length => {:is => 5, :message => "Zip code must be 5 digits long."}, allow_blank: true
  validates :phone_no, :length => {:is => 10, :message => "Please enter a valid phone number."}, presence: true
  validates :phone_no, uniqueness: true

  before_validation(on: :create) do
    self.phone_no = phone_no.gsub(/\D/, "") if attribute_present?("phone_no")
  end 

  def send_text
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
      to: self.phone_no,
      body: body
    )
  end
end
