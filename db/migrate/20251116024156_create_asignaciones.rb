class CreateAsignaciones < ActiveRecord::Migration[8.0]
  def change
    create_table :asignaciones do |t|
      t.string :nombre
      t.references :empleado, null: false, foreign_key: true
      t.references :evento, null: false, foreign_key: true
      t.string :rol
      t.string :tarea
      t.string :estado
      t.timestamps
    end
  end
end



