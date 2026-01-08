class Asignacion < ApplicationRecord
  self.table_name = "asignaciones"  # asegura la tabla correcta
  belongs_to :empleado
  belongs_to :evento

  validates :empleado_id, :evento_id, presence: true
end
