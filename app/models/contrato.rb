class Contrato < ApplicationRecord
  belongs_to :cliente
  belongs_to :evento
  has_many :detalle_contratos
  has_many :servicios, through: :detalle_contratos

  before_create :set_numero_contrato

  private

  def set_numero_contrato
    # Genera un número de contrato tipo C-2025-001
    last_id = Contrato.maximum(:id).to_i + 1
    self.numero_contrato ||= "C-#{Time.now.year}-#{format('%03d', last_id)}"
  end
end
