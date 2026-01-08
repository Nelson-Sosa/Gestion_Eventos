class CreateContratos < ActiveRecord::Migration[8.0]
  def change
    create_table :contratos do |t|
      t.string :numero_contrato
      t.datetime :fecha_contrato
      t.decimal :monto_total
      t.string :estado
      t.references :evento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
