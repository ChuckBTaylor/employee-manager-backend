class Client < ApplicationRecord
  belongs_to :company
  has_many :projects, dependent: :destroy
  has_many :pieces, through: :projects

end
