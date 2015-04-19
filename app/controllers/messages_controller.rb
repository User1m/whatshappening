class MessagesController < ApplicationController
  def forward
    sender = params["From"]
    message = params["Body"]

    puts sender
    puts message
  end
end
