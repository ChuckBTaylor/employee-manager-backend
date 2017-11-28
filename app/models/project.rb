class Project < ApplicationRecord
  belongs_to :client
  has_many :pieces, dependent: :destroy

end
