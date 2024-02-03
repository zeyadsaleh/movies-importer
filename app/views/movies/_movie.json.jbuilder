json.extract! movie, :id, :name, :desc, :year, :actor_id, :director_id, :city_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
