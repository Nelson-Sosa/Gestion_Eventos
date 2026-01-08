class Cliente < ApplicationRecord
  has_many :eventos
  has_many :contratos
end