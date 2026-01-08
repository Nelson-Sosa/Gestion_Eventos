  class AsignacionesController < ApplicationController
    before_action :set_asignacion, only: [:show, :edit, :update, :destroy]

    # GET /asignaciones
    def index
      @asignaciones = Asignacion.includes(:evento, :empleado)

      if params[:search].present?
        search = "%#{params[:search].downcase}%"
        @asignaciones = @asignaciones.where(
          "LOWER(asignaciones.estado) LIKE ? OR
       LOWER(asignaciones.rol) LIKE ? OR
       LOWER(asignaciones.tarea) LIKE ? OR
       LOWER(eventos.nombre_evento) LIKE ? OR
       LOWER(empleados.nombre) LIKE ?",
          search, search, search, search, search
        ).references(:evento, :empleado)
      end

      # Paginación: 10 por página
      @asignaciones = @asignaciones.order(:id).page(params[:page]).per(5)
    end



    # GET /asignaciones/new
    def new
      @asignacion = Asignacion.new
    end

    # POST /asignaciones
    def create
      @asignacion = Asignacion.new(asignacion_params)
      if @asignacion.save
        # Redirige al índice de asignaciones
        redirect_to asignaciones_url, notice: "Asignación creada correctamente."
      else
        render :new
      end
    end

    # GET /asignaciones/:id
    def show
    end

    # GET /asignaciones/:id/edit
    def edit
    end

    # PATCH/PUT /asignaciones/:id
    def update
      if @asignacion.update(asignacion_params)
        redirect_to asignaciones_url, notice: "Asignación actualizada correctamente."
      else
        render :edit
      end
    end

    # DELETE /asignaciones/:id
    def destroy
      @asignacion.destroy
      redirect_to asignaciones_url, notice: "Asignación eliminada correctamente."
    end

    private

    def set_asignacion
      @asignacion = Asignacion.find(params[:id])
    end

    def asignacion_params
      params.require(:asignacion).permit(:nombre, :empleado_id, :evento_id, :rol, :tarea, :estado)
    end
  end

