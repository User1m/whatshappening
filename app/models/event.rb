class Event < ActiveRecord::Base
	validates :start_date, :end_date, :location, :name, :price, :description, :link, :allow_blank: true
end