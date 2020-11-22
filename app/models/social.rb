class Social < ApplicationRecord
	belongs_to :portfolio

	enum kind: { facebook: 1, twitter: 2, linkedin: 3 , github: 4, intagram: 5 }

	validates :kind, presence: true
	validates :url, presence: true, http_url: true
end
