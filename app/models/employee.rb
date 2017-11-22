class Employee < ApplicationRecord
  belongs_to :company, optional: true
  has_many :schedules

  validates :name, presence: true
end
