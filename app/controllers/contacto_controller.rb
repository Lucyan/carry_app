class ContactoController < ApplicationController

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(params[:message])

		if @message.valid?
			NotificationsMailer.new_message(@message).deliver
			redirect_to(contacto_path, :notice => "Mensaje enviado correctamente")
		else
			flash.now.alert = "Por favor ingresa todos los campos"
			render :new
		end
	end
end
