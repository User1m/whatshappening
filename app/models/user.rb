class User < ActiveRecord::Base
	# validates :email, :format => { :with => ([a-z|A-Z|0-9]*@.*\..{2,})}
	validates :zipcode, :length => {:is => 5, :message => "Zip code must be 5 digits long."}, :allow_blank => true
	validates :phone_no, :length => {:minimum => 10, :message => "Please enter a valid phone number."}, :presence => true
	validates :email, :uniqueness => true, :allow_blank => true
	# validates :name, :allow_blank => true
end