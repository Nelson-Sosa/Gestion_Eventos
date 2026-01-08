class ReportesController < ApplicationController
  def index
    # Página principal de reportes con botones
  end

  def clientes
    @clientes = Cliente.all
  end

  def eventos
    @eventos = Evento.all
  end

  def servicios
    @servicios = Servicio.all
  end

  def asignaciones
    @asignaciones = Asignacion.all
  end
end
