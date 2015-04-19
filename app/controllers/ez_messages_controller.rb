require 'net/http'
require "open-uri"

class EzMessagesController < ApplicationController

  def index

  # http get all message.
  uri = URI.parse("https://app.eztexting.com/incoming-messages?format=json&User=#{ENV["EZUSERNAME"]}&Password=#{ENV["EZPASSWORD"]}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this
  @data = http.get(uri.request_uri)
  @data = @data.body
end

def find
   uri = URI.parse("https://app.eztexting.com/incoming-messages/15468266?format=json&User=#{ENV["EZUSERNAME"]}&Password=#{ENV["EZPASSWORD"]}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this
  @data = http.get(uri.request_uri)
  @data = @data.body
end



end
