class Movie < ApplicationRecord
  belongs_to :actor
  belongs_to :director
  belongs_to :city
  has_many :reviews, dependent: :nullify
  validates_presence_of :name
  validates :year, allow_blank: true, numericality: { only_integer: true, greater_than_or_equal_to: 1800, less_than_or_equal_to: Time.current.year }
end
