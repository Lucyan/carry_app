class CotizarController < ApplicationController
	def nuevo
		@cotizacion = Cotiza.new
		@punto_origen = Punto.new
		@punto_destino = Punto.new
		if !session[:puntos]
			session[:puntos] = []
		end
	end

	def agregar_puntos
		session[:puntos].push Punto.new(params[:punto])

		render :json => session[:puntos].to_json

		# respond_to do |format|
		# 	format.json { render :json => @punto.to_json }
		# end
	end

	def entregar_puntos
		render :json => session[:puntos].to_json
	end

	def eliminar_puntos
		session[:puntos] = []
		render :json => session[:puntos].to_json
	end

	def mover_arriba
		
	end
end
