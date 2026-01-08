class CreateEventos < ActiveRecord::Migration[8.0]
  def change
    create_table :eventos do |t|
      t.string :nombre_evento
      t.string :tipo_evento
      t.datetime :fecha_inicio
      t.datetime :fecha_fin
      t.string :lugar
      t.string :estado
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
