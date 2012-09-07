class AddComunaToPuntos < ActiveRecord::Migration
  def change
    add_column :puntos, :comuna, :string
  end
end
