class MessagesController < ApplicationController
  def forward
    sender = params["From"]
    message = params["Body"]

    @client = Twilio::REST::Client.new ENV['TWILIOSID'], ENV['TWILIOTOKEN']

    @client.messages.create(
      from: ENV['TWILIOPHONE'],
      to: sender,
      body: "you tried"
    )

    render nothing: true
  end
end
