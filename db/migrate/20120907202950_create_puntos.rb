class CreatePuntos < ActiveRecord::Migration
  def change
    create_table :puntos do |t|
      t.integer :numero
      t.string :tipo
      t.string :calle
      t.integer :numero
      t.string :interseccion
      t.integer :cotiza_id

      t.timestamps
    end
  end
end
