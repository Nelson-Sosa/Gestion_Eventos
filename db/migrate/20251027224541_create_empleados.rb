class CreateEmpleados < ActiveRecord::Migration[8.0]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :puesto
      t.string :telefono
      t.string :email
      t.boolean :activo

      t.timestamps
    end
  end
end
