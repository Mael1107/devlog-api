class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :entry_tags
  has_many :entries, through: :entry_tags
end
