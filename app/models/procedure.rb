class Procedure < ApplicationRecord
  belongs_to :service, optional: true
  belongs_to :piece
end
