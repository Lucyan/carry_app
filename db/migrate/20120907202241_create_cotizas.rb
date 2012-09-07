class CreateCotizas < ActiveRecord::Migration
  def change
    create_table :cotizas do |t|
      t.string :nombre
      t.string :email
      t.integer :telefono
      t.datetime :fecha

      t.timestamps
    end
  end
end
