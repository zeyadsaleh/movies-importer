class Actor < ApplicationRecord
    validates_presence_of :name
    has_many :movies, dependent: :nullify
end
