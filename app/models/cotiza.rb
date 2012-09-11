class Cotiza < ActiveRecord::Base
  attr_accessible :email, :fecha, :nombre, :telefono, :numero_personas
  has_many :puntos
end
