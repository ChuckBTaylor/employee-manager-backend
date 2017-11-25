class Employee < ApplicationRecord
  belongs_to :company, optional: true
  has_many :schedules, dependent: :delete_all

  validates :name, presence: true
end
