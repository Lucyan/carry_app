class AddEstadoToCotizas < ActiveRecord::Migration
  def change
    add_column :cotizas, :estado, :integer
  end
end
