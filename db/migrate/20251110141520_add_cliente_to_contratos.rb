class AddClienteToContratos < ActiveRecord::Migration[8.0]
  def change
    add_reference :contratos, :cliente, null: false, foreign_key: true
  end
end
