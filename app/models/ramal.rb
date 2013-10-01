class Ramal < ActiveRecord::Base
  attr_accessible :tipo_protocolo,:ramal,:call_limit, :callerid, :canreinvite, :context, :dtmfmode, :host, :nat, :secret,:tipo,:username
end
