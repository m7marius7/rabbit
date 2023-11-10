class Message < ApplicationRecord
  broadcasts_to :room
  belongs_to :room, dependent: :destroy
  belongs_to :user
end
