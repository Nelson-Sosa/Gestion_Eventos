class CreateServicios < ActiveRecord::Migration[8.0]
  def change
    create_table :servicios do |t|
      t.string :nombre
      t.string :categoria
      t.string :descripcion
      t.decimal :costo_base
      t.boolean :activo

      t.timestamps
    end
  end
end
