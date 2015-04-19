class MessagesController < ApplicationController
  def forward
    sender = params[:PhoneNumber]
    message = params[:Message]

    unless sender.blank?
      response = "Thanks."
      render text: "{SMS:TEXT}{}{}{"+sender+"}{"+response+"}"
    else
      render text: "The Ruby on Rails script is waiting for messages"
    end
  end
end
