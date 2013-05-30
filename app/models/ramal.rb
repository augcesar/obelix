class Ramal < ActiveRecord::Base
  attr_accessible :ramal,:call_limit, :callerid, :canreinvite, :context, :dtmfmode, :host, :nat, :secret,:tipo,:username
end
