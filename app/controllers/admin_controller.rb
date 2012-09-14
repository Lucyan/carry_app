class AdminController < ApplicationController
  def index
  	if session[:login]
  		redirect_to admin_listado_path
  	end
  end

  def login
	user = User.find_by_email(params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password])
		session[:login] = user
		redirect_to admin_listado_path
	else
		flash.now[:error] = 'Usuario o Password Incorrectos'
		render 'index'
    end
  end

  def logout
  	session[:login] = nil
  	redirect_to admin_path
  end

  def listado
  	if session[:login]
  		@cotizaciones = Cotiza.find_all_by_estado(0)
  	else
  		redirect_to admin_path
  	end
  end

  def listado_archivados
  	if session[:login]
  		@cotizaciones = Cotiza.find_all_by_estado(1)
  	else
  		redirect_to admin_path
  	end
  end

  def eliminar_cotizacion
  	@cotizacion = Cotiza.find(params[:id])
  	if @cotizacion.destroy
  		datos = { "status" => 0}
  	else
  		datos = { "status" => 1}
  		datos = { "error" => @cotizacion.errors.full_messages}
  	end
  	render :json => datos.to_json
  end

  def archivar_cotizacion
  	@cotizacion = Cotiza.find(params[:id])
  	if @cotizacion.update_attribute(:estado, 1)
  		datos = {"status" => 0}
  	else
  		datos = {"status" => 1}
  		datos = { "error" => @cotizacion.errors.full_messages}
  	end
  	render :json => datos.to_json
  end
end
