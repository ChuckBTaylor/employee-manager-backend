class Schedule < ApplicationRecord
  belongs_to :employee

  validates :scheduled_start, :scheduled_end, presence: true
end
