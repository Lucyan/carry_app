class AddCiudadPaisToPuntos < ActiveRecord::Migration
  def change
    add_column :puntos, :ciudad, :string
    add_column :puntos, :pais, :string
  end
end
