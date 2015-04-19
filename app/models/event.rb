class Event < ActiveRecord::Base
  before_create :shorten_link

  private

  def shorten_link
    Bitly.use_api_version_3

    Bitly.configure do |config|
      config.api_version = 3
      config.access_token = ENV['BITLYAPI']
    end

    bitly = Bitly.client.shorten(self.link)

    self.link = bitly.short_url
  end
end
