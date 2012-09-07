class Cotiza < ActiveRecord::Base
  attr_accessible :email, :fecha, :nombre, :telefono
  has_many :puntos
end
