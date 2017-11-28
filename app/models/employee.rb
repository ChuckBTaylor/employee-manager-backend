class Employee < ApplicationRecord
  belongs_to :company, optional: true
  has_many :schedules, dependent: :destroy

  validates :name, presence: true
end
