class CreateDetalleContratos < ActiveRecord::Migration[8.0]
  def change
    create_table :detalle_contratos do |t|
      t.references :contrato, null: false, foreign_key: true
      t.references :servicio, null: false, foreign_key: true
      t.integer :cantidad
      t.decimal :precio_unitario
      t.decimal :subtotal
      t.string :notas

      t.timestamps
    end
  end
end
