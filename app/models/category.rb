class Category < ActiveRecord::Base
	to_param :name
	validates :name, uniqueness: true
    has_many :businesses
end
