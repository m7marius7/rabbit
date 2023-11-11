class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :permalink, use: [:slugged, :history, :finders]

    validates :meta_title, presence: true, uniqueness: true, length: { in: 1..5 }
    validates :meta_description, presence: true, uniqueness: true, length: { in: 1..5 }
    validates :permalink, presence: true, uniqueness: true

    def should_generate_new_friendly_id?
        permalink_changed?
    end

end
