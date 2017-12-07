class Project < ApplicationRecord
  belongs_to :client
  has_many :pieces, dependent: :destroy

  after_save :confirm_save



  def build_procedure_sheet
    procedures = self.pieces.map{|p| p.procedures}.flatten

    {pieces: self.pieces, procedures: procedures.map{|p| p.for_json}}
  end


  def total_est
    self.pieces.map(&:total_est).inject(0, &:+)
  end

  def procedure_ids
    self.pieces.map(&:procedures).flatten.map(&:id)
  end

  def get_total_worked
    self.pieces.map(&:total_worked).inject(0, &:+)
  end

  def update_total_worked
    self.update(total_worked: self.get_total_worked)
  end

  def confirm_save
    puts "project has been updated"
  end

end
