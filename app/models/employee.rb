class Employee < ApplicationRecord
  belongs_to :company, optional: true
  has_many :schedules, dependent: :destroy
  has_many :operations

  validates :name, presence: true

  has_secure_password
end
