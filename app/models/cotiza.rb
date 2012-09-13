class Cotiza < ActiveRecord::Base
  attr_accessible :email, :fecha, :nombre, :telefono, :numero_personas
  has_many :puntos

  validates :nombre, :presence => true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, format: { with: VALID_EMAIL_REGEX }
  validates :telefono, :presence => true
  validates :fecha, :presence => true
  validates :numero_personas, :presence => true
end
