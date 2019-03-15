class Item < ApplicationRecord
	has_one_attached :picture
	has_many :carts
	has_many :users ,through: :carts
end
