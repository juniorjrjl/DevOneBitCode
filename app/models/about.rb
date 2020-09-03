class About < ApplicationRecord
	belongs_to :portfolio

	validates :descritpion, presence: true
end
