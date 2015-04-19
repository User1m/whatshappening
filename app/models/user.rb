class User < ActiveRecord::Base
  validates :email, email: true, allow_blank: true
  validates :zipcode, :length => {:is => 5, :message => "Zip code must be 5 digits long."}, allow_blank: true
  validates :phone_no, :length => {:is => 10, :message => "Please enter a valid phone number."}, presence: true, allow_blank: true
  validates :email, :phone_no, uniqueness: true
end
