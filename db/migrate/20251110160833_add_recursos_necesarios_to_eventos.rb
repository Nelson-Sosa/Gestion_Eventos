class AddRecursosNecesariosToEventos < ActiveRecord::Migration[8.0]
  def change
    add_column :eventos, :recursos_necesarios, :text
  end
end
