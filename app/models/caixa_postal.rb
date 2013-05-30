class CaixaPostal < ActiveRecord::Base
  belongs_to :ramal
  attr_accessible :descricao,:ramal_id
end
