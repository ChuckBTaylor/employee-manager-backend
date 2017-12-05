class Client < ApplicationRecord
  belongs_to :company
  has_many :projects, dependent: :destroy

end
