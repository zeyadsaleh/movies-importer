class Movie < ApplicationRecord
  belongs_to :actor
  belongs_to :director
  belongs_to :city
end
