class MessagesController < ApplicationController
  def forward
    sender = params["From"]
    message = params["Body"]

    @client = Twilio::REST::Client.new ENV['TWILIOSID'], ENV['TWILIOTOKEN']

    keyword = message.split.first.downcase
    body = ""

    case keyword
    when "events"
      body = "Here are some events:"
    when "help"
      body = "Do this and this."
    else
      body = "Couldn't process."
    end

    @client.messages.create(
      from: ENV['TWILIOPHONE'],
      to: sender,
      body: body
    )

    render nothing: true
  end
end
