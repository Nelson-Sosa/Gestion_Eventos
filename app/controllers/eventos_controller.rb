class EventosController < ApplicationController
  before_action :set_evento, only: %i[show edit update destroy]

  # GET /eventos
  def index
    @eventos = Evento.includes(:cliente)

    if params[:search].present?
      search = "%#{params[:search].downcase}%"
      @eventos = @eventos.joins(:cliente).where(
        "LOWER(eventos.nombre_evento) LIKE ? OR
       LOWER(eventos.tipo_evento) LIKE ? OR
       LOWER(eventos.lugar) LIKE ? OR
       LOWER(eventos.estado) LIKE ? OR
       LOWER(eventos.recursos_necesarios) LIKE ? OR
       LOWER(clientes.nombre) LIKE ? OR
       LOWER(clientes.apellido) LIKE ?",
        search, search, search, search, search, search, search
      )
    end

    # Paginación con Kaminari, 10 por página
    @eventos = @eventos.order(:id).page(params[:page]).per(5)
  end


  # GET /eventos/:id
  def show
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
  end

  # GET /eventos/:id/edit
  def edit
  end

  # POST /eventos
  def create
    @evento = Evento.new(evento_params)
    if @evento.save
      flash[:notice] = "Evento creado correctamente."
      redirect_to eventos_path
    else
      flash.now[:alert] = "Hubo errores al guardar el evento."
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /eventos/:id
  def update
    if @evento.update(evento_params)
      flash[:notice] = "Evento actualizado correctamente."
      redirect_to eventos_path
    else
      flash.now[:alert] = "Hubo errores al actualizar el evento."
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /eventos/:id
  def destroy
    @evento.destroy
    flash[:notice] = "Evento eliminado correctamente."
    redirect_to eventos_path
  end

  private

  def set_evento
    @evento = Evento.find(params[:id])
  end

  def evento_params
    params.require(:evento).permit(:cliente_id, :nombre_evento, :tipo_evento, :fecha_inicio, :fecha_fin, :lugar, :estado, :recursos_necesarios)
  end
end
