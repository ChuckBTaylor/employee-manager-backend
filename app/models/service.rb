class Service < ApplicationRecord
  belongs_to :company
  has_many :procedures
end
