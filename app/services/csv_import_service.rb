class CsvImportService
    require 'csv'
  
    attr_reader :file_path, :model, :attributes
  
    def initialize(file_path, model, attributes)
      @file_path = file_path
      @model = model
      @attributes = attributes
    end
  
    def call
        # total_rows = CSV.read(file_path, headers: true).length #to use it in the progress percentage later
        rows = CSV.read(file_path, headers: true).map do |row|
            attrs = model.name == "Movie" ?  movie_mapper(attributes, row) : review_mapper(attributes, row)
            model.new attrs
        end
        model_mapper(rows, model) 
        puts "#{model.name} CSV data imported successfully!"
    end
  
    private

    def model_mapper(rows, model)
        model.import(rows)
    rescue ActiveRecord::RecordInvalid => e
      rows.each_with_index do |row, index|
        puts "Error importing #{model.name.downcase} '#{row.attributes[rows.first.attributes.keys.first]}': #{row.errors.full_messages.join(', ')}"
      end  
    end
  
   
  def movie_mapper(attributes, row)
    movie_hash = {}
    attributes.each do |attr|  
        case attr
        when "Movie" 
            mapper = "name"
        when "Description"
            mapper = "desc"
        when "Year"
            mapper = "year"
        when "Director"
            mapper = "director_id"
            row[attr] = Director.find_or_create_by!(name: row[attr]).id
        when "Actor"
            mapper = "actor_id"
            row[attr] = Actor.find_or_create_by!(name: row[attr]).id
        when "Filming location"
            mapper = "city_id"
            country_id = Country.find_or_create_by!(name: row["Country"]).id
            row[attr] = City.find_or_create_by!(name: row[attr], country_id: country_id).id
        end
        movie_hash[mapper] = row[attr] if mapper.present?
    end
    movie_hash
  end


    def review_mapper(attributes, row)
        review_hash = {}
        attributes.each do |attr|  
            case attr
            when "Movie" 
                mapper = "movie_id"
                row[attr] = Movie.find_by!(name: row[attr])&.id
            when "User"
                mapper = "user_id"
                row[attr] = User.find_or_create_by!(name: row[attr]).id
            when "Stars"
                mapper = "rate"
            when "Review"
                mapper = "comment"
            end
            review_hash[mapper] = row[attr] if mapper.present?
        end
        review_hash
    end
  end
  