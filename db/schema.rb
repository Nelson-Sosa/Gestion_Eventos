# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_11_16_024156) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "asignaciones", force: :cascade do |t|
    t.string "nombre"
    t.bigint "empleado_id", null: false
    t.bigint "evento_id", null: false
    t.string "rol"
    t.string "tarea"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empleado_id"], name: "index_asignaciones_on_empleado_id"
    t.index ["evento_id"], name: "index_asignaciones_on_evento_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "tipo"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "apellido"
  end

  create_table "contratos", force: :cascade do |t|
    t.string "numero_contrato"
    t.datetime "fecha_contrato"
    t.decimal "monto_total"
    t.string "estado"
    t.bigint "evento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cliente_id", null: false
    t.index ["cliente_id"], name: "index_contratos_on_cliente_id"
    t.index ["evento_id"], name: "index_contratos_on_evento_id"
  end

  create_table "detalle_contratos", force: :cascade do |t|
    t.bigint "contrato_id", null: false
    t.bigint "servicio_id", null: false
    t.integer "cantidad"
    t.decimal "precio_unitario"
    t.decimal "subtotal"
    t.string "notas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contrato_id"], name: "index_detalle_contratos_on_contrato_id"
    t.index ["servicio_id"], name: "index_detalle_contratos_on_servicio_id"
  end

  create_table "empleados", force: :cascade do |t|
    t.string "nombre"
    t.string "puesto"
    t.string "telefono"
    t.string "email"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string "nombre_evento"
    t.string "tipo_evento"
    t.datetime "fecha_inicio"
    t.datetime "fecha_fin"
    t.string "lugar"
    t.string "estado"
    t.bigint "cliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "recursos_necesarios"
    t.index ["cliente_id"], name: "index_eventos_on_cliente_id"
  end

  create_table "servicios", force: :cascade do |t|
    t.string "nombre"
    t.string "categoria"
    t.string "descripcion"
    t.decimal "costo_base"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "asignaciones", "empleados"
  add_foreign_key "asignaciones", "eventos"
  add_foreign_key "contratos", "clientes"
  add_foreign_key "contratos", "eventos"
  add_foreign_key "detalle_contratos", "contratos"
  add_foreign_key "detalle_contratos", "servicios"
  add_foreign_key "eventos", "clientes"
end
