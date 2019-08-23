class Guardian < ApplicationRecord
    validates :name, presence: true
    has_many :pets
end
