class User < ApplicationRecord
    validates_presence_of :name
    has_many :reviews, dependent: :nullify
end
