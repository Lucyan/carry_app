# Controller Cotiza
# Nota: Debug: logger.debug "TMP #{tmp.calle}"

class CotizarController < ApplicationController
	def nuevo
		@cotizacion = Cotiza.new
		@punto_origen = Punto.new
		@punto_destino = Punto.new
		if !session[:puntos]
			session[:puntos] = []
		end
	end

	def guardar
		@cotizacion = Cotiza.new
		@punto_origen = Punto.new
		@punto_destino = Punto.new
		if session[:puntos].length > 1
			@cotizacion = Cotiza.new(params[:cotiza])
			if @cotizacion.valid?
				session[:puntos].each do |puntos|
					@cotizacion.puntos.new(calle: puntos.calle, tipo: puntos.tipo, numero: puntos.numero.to_i, interseccion: puntos.interseccion, comuna: puntos.comuna)
				end
				@cotizacion.save
				session[:puntos] = []
				@cotizacion = Cotiza.new
				flash[:notice] = "Tu Cotizacion fue recibida, nos contactaremos contigo para su confirmacion"
			else
				flash[:error] = @cotizacion.errors.full_messages
			end
		else
			flash[:error] = ["Debes ingresar el Origen y al menos un Destino"]
		end
		render 'nuevo'
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

	def eliminar_todo
		session[:puntos] = []
		render :json => session[:puntos].to_json
	end

	def eliminar_punto
		session[:puntos].delete_at(params[:id].to_i)
		render :json => session[:puntos].to_json
	end

	def mover_arriba
		tmp = session[:puntos][params[:id].to_i-1]
		session[:puntos][params[:id].to_i-1] = session[:puntos][params[:id].to_i]
		session[:puntos][params[:id].to_i] = tmp
		render :json => session[:puntos].to_json
	end

	def mover_abajo
		tmp = session[:puntos][params[:id].to_i+1]
		session[:puntos][params[:id].to_i+1] = session[:puntos][params[:id].to_i]
		session[:puntos][params[:id].to_i] = tmp
		render :json => session[:puntos].to_json
	end
end
