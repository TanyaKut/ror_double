class Item < ApplicationRecord
	belongs_to :categorie
	has_many :orders
end
