class Order < ApplicationRecord
	belongs_to :shot
	belongs_to :user
end