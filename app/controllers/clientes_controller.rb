# app/controllers/clientes_controller.rb
class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[show edit update destroy]

  # GET /clientes
  def index
    if params[:search].present?
      query = "%#{params[:search]}%"
      @clientes = Cliente.where(
        "nombre LIKE ? OR apellido LIKE ? OR tipo LIKE ? OR telefono LIKE ?",
        query, query, query, query
      )
    else
      @clientes = Cliente.all
    end

    # Paginación con Kaminari (10 por página)
    @clientes = @clientes.order(:id).page(params[:page]).per(5)
  end



  # GET /clientes/:id
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # POST /clientes
  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      flash[:notice] = "Cliente creado correctamente."
      redirect_to clientes_path
    else
      flash.now[:alert] = "Hubo errores al guardar el cliente."
      render :new, status: :unprocessable_entity
    end
  end

  # GET /clientes/:id/edit
  def edit
  end

  # PATCH/PUT /clientes/:id
  def update
    if @cliente.update(cliente_params)
      flash[:notice] = "Cliente actualizado correctamente."
      redirect_to clientes_path
    else
      flash.now[:alert] = "Hubo errores al actualizar el cliente."
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /clientes/:id
  def destroy
    @cliente.destroy
    flash[:notice] = "Cliente eliminado correctamente."
    redirect_to clientes_path
  end

  private

  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  def cliente_params
    params.require(:cliente).permit(:nombre, :apellido, :tipo, :telefono)
  end


end
