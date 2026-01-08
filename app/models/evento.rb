class Evento < ApplicationRecord
  belongs_to :cliente
  has_many :asignacions
  has_many :empleados, through: :asignacions
  has_one :contrato
  validates :recursos_necesarios, presence: true
end
