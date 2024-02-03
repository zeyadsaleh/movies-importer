class City < ApplicationRecord
  validates_presence_of :name
  belongs_to :country
  has_many :movies, dependent: :nullify
end
