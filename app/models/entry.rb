class Entry < ApplicationRecord
  validates :title, presence: true

  has_many :entry_tags, dependent: :destroy
  has_many :tags, through: :entry_tags
end
