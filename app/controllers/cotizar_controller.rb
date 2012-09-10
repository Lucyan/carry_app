class CotizarController < ApplicationController
	def nuevo
		@cotizacion = Cotiza.new
		@punto_origen = Punto.new
		@punto_destino = Punto.new
    session[:puntos] = []
	end

	def entregar_puntos
		session[:puntos].push Punto.new(params[:punto])

		render :json => session[:puntos].to_json

		# respond_to do |format|
		# 	format.json { render :json => @punto.to_json }
		# end
	end
end
