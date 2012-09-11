class AddNumeroPersonasToCotizas < ActiveRecord::Migration
  def change
    add_column :cotizas, :numero_personas, :integer
  end
end
