require 'net/http'

class EzMessagesController < ApplicationController

  def index

  # http get all message.
  # url = URI.parse('https://app.eztexting.com/incoming-messages?format=json&User='<< ENV['EZUSERNAME'] << '&Password='<< ENV['EZPASSWORD'])

   url = URI.parse('https://app.eztexting.com/incoming-messages?format=json&User=user1m&Password=gbH@ck')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, 443) {|http|
    http.request(req)
  }
  puts res.body

end

def getOneMessage
end



end
