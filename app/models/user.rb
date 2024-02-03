class User < ApplicationRecord
    validates_presence_of :name
    has_many :reviews, dependent: :nullify


    #alias_attribute "Movie", :name


end
