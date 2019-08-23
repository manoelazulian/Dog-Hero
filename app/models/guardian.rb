class Guardian < ApplicationRecord
    validates :name, presence: true
end
