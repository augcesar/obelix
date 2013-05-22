class Sip < ActiveRecord::Base
  attr_accessible :bindaddr, :bindport, :context, :limitonpeers, :t38pt_udptl, :tos_audio, :tos_sip, :tos_video, :videosupport
end
