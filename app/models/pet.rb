class Pet < ApplicationRecord
    validates :name, presence: true
    belongs_to :guardian 
end
