class Tag < ApplicationRecord
    has_many :portifolio_tags
    validates :title, presence: true, uniqueness: true
end
