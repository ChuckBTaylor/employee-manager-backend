class Piece < ApplicationRecord
  belongs_to :project
  has_many :procedures
end
