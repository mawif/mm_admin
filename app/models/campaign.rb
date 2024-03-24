class Campaign < ApplicationRecord
    validates :name, presence: true
    enum :status, { open: 0, closed: 1, archived: 2 }, prefix: true, scopes: true, default: :open, validate: true

    has_many :student_applications
end
