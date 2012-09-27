class Punto < ActiveRecord::Base
  attr_accessible :calle, :cotiza_id, :interseccion, :numero, :tipo, :comuna, :ciudad, :pais, :latitude, :longitude, :gmaps
  belongs_to :cotiza
  before_save :llenar_campos

  acts_as_gmappable

	def gmaps4rails_address
		#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  		"#{self.calle} #{self.numero}, #{self.comuna}, #{self.ciudad}, #{self.pais}" 
	end

	private

	def llenar_campos
		self.ciudad = "Santiago"
		self.pais = "Chile"
	end
end
