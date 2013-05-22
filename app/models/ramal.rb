class Ramal < ActiveRecord::Base
  attr_accessible :call_limit, :callerid, :canreinvite, :context, :dtmfmode, :host, :nat, :secret, :type, :username
end
