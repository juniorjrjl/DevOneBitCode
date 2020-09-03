class PortfolioTag < ApplicationRecord
	belongs_to :portfolio
	belongs_to :tag

	validates :max_tags_for_portifolio
	validates :tag_id, uniqueness: {scope: :portifolio_id}

	private

	def max_tags_for_portifolio
		if portfolio.tags.count >= Portifolio::MAX_NUMBER_OF_TAGS
			errors.add(:portifolio, "can't have more than #{Portifolio::MAX_NUMBER_OF_TAGS} tags")
		end
	end
end
