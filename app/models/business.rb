class Business < ActiveRecord::Base
	to_param :name
	validates :name, uniqueness: true
	validates :name, :phone, :category, presence: true
	validates :phone, :fax, format: {with: /\A\([0-9]{3}\) [0-9]{3}-[0-9]{4}\z/,
		message: 'number must be in the form (123) 456-7890',
		allow_blank: true
	}
	validates :description, :image, presence: true, if: business.premium?
	belongs_to :category
end
