class AddApellidoToClientes < ActiveRecord::Migration[8.0]
  def change
    add_column :clientes, :apellido, :string
  end
end
