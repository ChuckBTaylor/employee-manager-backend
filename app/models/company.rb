class Company < ApplicationRecord
  has_many :employees
  has_many :products

  validates :name, presence: true



  def admin
    self.employees.select do |employee|
      employee.is_admin
    end
  end


end
