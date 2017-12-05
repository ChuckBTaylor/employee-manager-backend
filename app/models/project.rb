class Project < ApplicationRecord
  belongs_to :client
  has_many :planners_projects, dependent: :delete_all
  has_many :planners, through: :planners_projects
  has_many :pieces, dependent: :destroy

end
