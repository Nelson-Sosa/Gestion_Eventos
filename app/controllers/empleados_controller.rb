class EmpleadosController < ApplicationController

  def index
    @empleados = Empleado.all

    if params[:search].present?
      search = "%#{params[:search].downcase}%"
      @empleados = @empleados.where(
        "LOWER(nombre) LIKE ? OR
       LOWER(puesto) LIKE ? OR
       LOWER(telefono) LIKE ? OR
       LOWER(email) LIKE ?",
        search, search, search, search
      )
    end

    @empleados = @empleados.page(params[:page]).per(5)
  end



  def show
    @empleado = Empleado.find(params[:id])
  end

  def new
    @empleado = Empleado.new
  end

  def create
    @empleado = Empleado.new(empleado_params)
    if @empleado.save
      redirect_to empleados_path, notice: "Empleado registrado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @empleado = Empleado.find(params[:id])
  end

  def update
    @empleado = Empleado.find(params[:id])
    if @empleado.update(empleado_params)
      redirect_to empleados_path, notice: "Empleado actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @empleado = Empleado.find(params[:id])
    @empleado.destroy
    redirect_to empleados_path, notice: "Empleado eliminado."
  end

  private

  def empleado_params
    params.require(:empleado).permit(:nombre, :puesto, :telefono, :email, :activo)
  end
end
