# lib/tasks/import_data.rake
require 'csv'

namespace :import do
    desc 'Import movies from CSV file'
    task :movies => :environment do
        ImportDataJob.perform_later('lib/assets/movies.csv', Movie, 'Movie', 'Description', 'Year', 'Director', 'Actor', 'Filming location', 'Country')
    end
  
    desc 'Import reviews from CSV file'
    task :reviews => :environment do
        ImportDataJob.perform_later('lib/assets/reviews.csv', Review, 'Movie', 'User', 'Stars', 'Review')
    end
end