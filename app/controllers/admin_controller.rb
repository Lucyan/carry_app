class AdminController < ApplicationController
  def index
    redirect_to admin_listado_path
  end

  def login
	user = User.find_by_email(params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password])
		session[:login] = user
    session[:last_seen] = Time.now
		redirect_to admin_listado_path
	else
		flash.now[:error] = 'Usuario o Password Incorrectos'
		render 'index'
    end
  end

  def logout
  	reset_session
  	redirect_to admin_listado_path
  end

  def listado
  	autenticacion
  	@cotizaciones = Cotiza.find_all_by_estado(0)
  end

  def listado_archivados
  	autenticacion
  	@cotizaciones = Cotiza.find_all_by_estado(1)
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

  def autenticacion
    if session[:login]
      if session[:last_seen] < 1.hour.ago
        reset_session
        render 'index'
      end
      session[:last_seen] = Time.now
    else
      render 'index'
    end
  end
end
