class Room < ApplicationRecord
    has_many :messages, dependent: :destroy
    broadcasts_to ->(room){:rooms_list}
end
