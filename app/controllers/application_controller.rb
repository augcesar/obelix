#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  def guardar_sip_ramal_conf (object_sip,object_ramal)
  	begin
		sip =  File.open('/etc/asterisk/sip.conf','w')
		texto = ""
		
		object_sip.each do |sip|
		 	texto << "[general]\n"
			texto << "context=#{sip.context}\n"
			texto << "bindport=#{sip.bindport}\n"
			texto << "bindaddr=#{sip.bindaddr}\n"
			texto << "tos_sip=#{sip.tos_sip}\n"
			texto << "tos_audio=#{sip.tos_audio}\n"
			texto << "tos_video=#{sip.tos_video}\n"
			texto << "video_support=#{sip.videosupport}\n"
			texto << "t38pt_udptl=#{sip.t38pt_udptl}\n"
			texto << "allow=all\n"
			texto << "limitonpeers=#{sip.limitonpeers}\n\n"
		end
		object_ramal.each do |ramal|	
		 	texto << "[#{ramal.ramal}]\n"
			texto << "callerd=#{ramal.callerid}\n"
			texto << "type=#{ramal.tipo}\n"
			texto << "username=#{ramal.username}\n"
			texto << "secret=#{ramal.secret}\n"
			texto << "canreinvite=#{ramal.canreinvite}\n"
			texto << "host=#{ramal.host}\n"
			texto << "context=#{ramal.context}\n"
			texto << "dtmfmode=#{ramal.dtmfmode}\n"
			texto << "call-limit=#{ramal.call_limit}\n"
			texto << "nat=#{ramal.nat}\n"
			# texto << "language=#{ramal.limitonpeers}\n\n"
		end

		sip.write texto
		sip.close

		# Reload Asterisk
		`asterisk -x 'sip reload'`	
	rescue Exception => e
	 	flash[:info] = "Não foi possível guardar os dados na voicemail.conf"
	 end  
  end

  def guardar_extensao_conf (object_extension)
	 begin
		sip =  File.open('/etc/asterisk/extensions.conf','w')
		sip.write object_extension.descricao
		sip.close	 	
	 rescue Exception => e
	 	flash[:info] = "Não foi possível guardar os dados na extension.conf"
	 end


	# Reload Asterisk
	`asterisk -x 'dialplan reload'`	
  end

  def guardar_caixa_postal_conf (object_box)
	 begin
		sip =  File.open('/etc/asterisk/voicemail.conf','w')
		text = "[LOCAL]\n"
		
		object_box.each do |box|
			text << "#{box.ramal.ramal} => #{box.descricao}\n"
		end

		sip.write text
		sip.close	

		# Reload Asterisk
		`asterisk -x 'voicemail reload'`			 	
	 rescue Exception => e
	 	flash[:info] = "Não foi possível guardar os dados na voicemail.conf"
	 end  	
  end

end
