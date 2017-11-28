class Piece < ApplicationRecord
  belongs_to :project
  has_many :procedures, dependent: :delete_all
end
