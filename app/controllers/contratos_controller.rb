class ContratosController < ApplicationController
  before_action :set_contrato, only: %i[show edit update destroy]

  def index
    @contratos = Contrato.includes(:cliente, :evento)

    if params[:search].present?
      search = "%#{params[:search].downcase}%"
      @contratos = @contratos.where(
        "LOWER(clientes.nombre) LIKE ? OR
       LOWER(clientes.apellido) LIKE ? OR
       LOWER(eventos.tipo_evento) LIKE ? OR
       LOWER(contratos.numero_contrato) LIKE ? OR
       LOWER(contratos.estado) LIKE ?",
        search, search, search, search, search
      ).references(:cliente, :evento)
    end

    # 👉 Agregamos la paginación (10 por página)
    @contratos = @contratos.order(:id).page(params[:page]).per(5)
  end


  def show
  end

  def new
    @contrato = Contrato.new
  end

  def create
    @contrato = Contrato.new(contrato_params)
    if @contrato.save
      flash[:notice] = "Contrato creado correctamente."
      redirect_to contratos_path
    else
      flash.now[:alert] = "Hubo errores al guardar el contrato."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @contrato.update(contrato_params)
      flash[:notice] = "Contrato actualizado correctamente."
      redirect_to contratos_path
    else
      flash.now[:alert] = "Hubo errores al actualizar el contrato."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contrato.destroy
    flash[:notice] = "Contrato eliminado correctamente."
    redirect_to contratos_path
  end

  private

  def set_contrato
    @contrato = Contrato.find(params[:id])
  end

  def contrato_params
    params.require(:contrato).permit(:numero_contrato, :fecha_contrato, :monto_total, :estado, :cliente_id, :evento_id)
  end
end
