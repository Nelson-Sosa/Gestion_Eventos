class ServiciosController < ApplicationController
  before_action :set_servicio, only: [:show, :edit, :update, :destroy]

  def index
    @servicios = Servicio.all

    if params[:search].present?
      search = "%#{params[:search].downcase}%"
      @servicios = @servicios.where(
        "LOWER(nombre) LIKE ? OR
       LOWER(categoria) LIKE ? OR
       LOWER(descripcion) LIKE ? OR
       CAST(activo AS TEXT) LIKE ?",
        search, search, search, search
      )
    end

    # 👉 Paginación (10 por página)
    @servicios = @servicios.order(:id).page(params[:page]).per(5)
  end


  def show
  end

  def new
    @servicio = Servicio.new
  end

  def create
    @servicio = Servicio.new(servicio_params)
    if @servicio.save
      redirect_to servicios_path, notice: 'Servicio creado correctamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @servicio.update(servicio_params)
      redirect_to servicios_path, notice: 'Servicio actualizado correctamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @servicio.destroy
    redirect_to servicios_path, notice: 'Servicio eliminado correctamente.'
  end

  private

  def set_servicio
    @servicio = Servicio.find(params[:id])
  end

  def servicio_params
    params.require(:servicio).permit(:nombre, :categoria, :descripcion, :costo_base, :activo)
  end
end
