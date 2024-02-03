class Movie < ApplicationRecord
  belongs_to :actor
  belongs_to :director
  belongs_to :city
  has_many :reviews, dependent: :nullify
  validates_presence_of :name
  validates :year, allow_blank: true, numericality: { only_integer: true, greater_than_or_equal_to: 1800, less_than_or_equal_to: Time.current.year }

  def self.ransackable_attributes(auth_object = nil)
    ["actor_id", "city_id", "created_at", "desc", "director_id", "id", "id_value", "name", "updated_at", "year"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["actor", "city", "director", "reviews"]
    end

  def average_reviews
    reviews.average(:rate)
  end

  scope :sort_by_average_reviews_asc, -> {
    select('movies.*,AVG(reviews.rate)').
    joins('LEFT JOIN reviews ON movies.id = reviews.movie_id')
      .group('movies.id')
      .order('AVG(reviews.rate) ASC NULLS LAST')
  }  
  scope :sort_by_average_reviews_desc, -> {
    select('movies.*,AVG(reviews.rate)').
    joins('LEFT JOIN reviews ON movies.id = reviews.movie_id')
      .group('movies.id')
      .order('AVG(reviews.rate) DESC NULLS LAST')
  }  
end
