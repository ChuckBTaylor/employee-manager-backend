class Company < ApplicationRecord
  has_many :employees
  has_many :services
  has_many :clients
  has_many :services

  validates :name, presence: true



  def admin
    self.employees.select do |employee|
      employee.is_admin
    end
  end


  def get_master_schedule
    master_schedule = self.employees.map do |employee|
      employee.schedules
    end.flatten
  end

  def projects
    self.clients.map do |client|
      client.projects
    end.flatten
  end


end
