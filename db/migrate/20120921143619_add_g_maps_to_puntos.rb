class AddGMapsToPuntos < ActiveRecord::Migration
  def change
  	add_column :puntos, :latitude,  :float #you can change the name, see wiki
	add_column :puntos, :longitude, :float #you can change the name, see wiki
	add_column :puntos, :gmaps, :boolean #not mandatory, see wiki
  end
end
