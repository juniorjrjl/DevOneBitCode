class Social < ApplicationRecord
	belongs_to :portfolio

	enum kind: [:facebook, :twitter, :linkedin, :github, :intagram, :other]
	validates :url, presence: true, http_url: true
end
