class Cotiza < ActiveRecord::Base
  attr_accessible :email, :fecha, :nombre, :telefono, :numero_personas
  has_many :puntos

  validates :nombre, :presence => true
  validates :email, :presence => true
  validates :telefono, :presence => true
  validates :fecha, :presence => true
  validates :numero_personas, :presence => true
end
