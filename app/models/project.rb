class Project < ApplicationRecord
  belongs_to :client
  has_and_belongs_to_many :planners
  has_many :pieces, dependent: :destroy

end
