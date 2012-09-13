class AdminController < ApplicationController
  def index
  end

  def listado
  	@cotizaciones = Cotiza.all
  end
end
