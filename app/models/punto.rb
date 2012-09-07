class Punto < ActiveRecord::Base
  attr_accessible :calle, :cotiza_id, :interseccion, :numero, :tipo, :comuna
  belongs_to :cotiza
end
