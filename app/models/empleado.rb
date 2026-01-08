class Empleado < ApplicationRecord
  has_many :asignacions
  has_many :eventos, through: :asignacions
end
