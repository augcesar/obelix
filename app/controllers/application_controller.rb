#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  def guardar_sip_ramal_conf (object_sip,object_ramal)
  	begin
		sip =  File.open('/etc/asterisk/sip.conf','w')
		texto = ""
		
		object_sip.each do |sip|
		 	texto << "[general]\n"
			texto << "context=#{sip.context}\n" unless sip.context.blank?
			texto << "bindport=#{sip.bindport}\n" unless sip.bindport.blank?
			texto << "bindaddr=#{sip.bindaddr}\n" unless sip.bindaddr.blank?
			texto << "tos_sip=#{sip.tos_sip}\n" unless sip.tos_sip.blank?
			texto << "tos_audio=#{sip.tos_audio}\n" unless sip.tos_audio.blank?
			texto << "tos_video=#{sip.tos_video}\n" unless sip.tos_video.blank?
			texto << "video_support=#{sip.videosupport}\n" unless sip.videosupport.blank?
			texto << "t38pt_udptl=#{sip.t38pt_udptl}\n" unless sip.t38pt_udptl.blank?
			texto << "allow=all\n"
			texto << "udpbindaddr=0.0.0.0\n"
			texto << "limitonpeers=#{sip.limitonpeers}\n\n" unless sip.limitonpeers.blank?
		end
		object_ramal.each do |ramal|
			if ramal.tipo_protocolo == 'sip'
			 	texto << "[#{ramal.ramal}]\n" unless ramal.ramal.blank?
				texto << "callerd=#{ramal.callerid}\n"  unless ramal.callerid.blank?
				texto << "type=#{ramal.tipo}\n"  unless ramal.tipo.blank?
				texto << "username=#{ramal.username}\n"  unless ramal.username.blank?
				texto << "secret=#{ramal.secret}\n"  unless ramal.secret.blank?
				texto << "canreinvite=#{ramal.canreinvite}\n"  unless ramal.canreinvite.blank?
				texto << "host=#{ramal.host}\n"  unless ramal.host.blank?
				texto << "context=#{ramal.context}\n"  unless ramal.context.blank?
				texto << "dtmfmode=#{ramal.dtmfmode}\n"  unless ramal.dtmfmode.blank?
				texto << "call-limit=#{ramal.call_limit}\n"  unless ramal.call_limit.blank?
				texto << "nat=#{ramal.nat}\n" unless ramal.nat.blank?
				texto << "language=pt_BR\n"
				texto << "disallow=all\n"
				texto << "allow=ulaw,alaw,gsm\n\n"
			end
		end

		sip.write texto
		sip.close

		# Reload Asterisk
		`asterisk -x 'sip reload'`	
	rescue Exception => e
	 	flash[:info] = "Não foi possível guardar os dados na sip.conf"
	 end  
  end
def guardar_iax_ramal_conf (object_iax,object_ramal)
  	begin
		iax =  File.open('/etc/asterisk/iax.conf','w')
		texto = ""
		
		object_iax.each do |iax|
		 	texto << "[general]\n"
			texto << "bindport=#{iax.bindport}\n" unless iax.bindport.blank?
			texto << "bindaddr=#{iax.bindaddr}\n" unless iax.bindaddr.blank?
			texto << "bandwidth=#{iax.bandwidth}\n" unless iax.bandwidth.blank?
			texto << "allow=#{iax.allow}\n" unless iax.allow.blank?
			texto << "tos=#{iax.tos}\n" unless iax.tos.blank?		
		end
		object_ramal.each do |ramal|
			if ramal.tipo_protocolo == 'iax2'
			 	texto << "[#{ramal.ramal}]\n" unless ramal.ramal.blank?
				texto << "callerd=#{ramal.callerid}\n"  unless ramal.callerid.blank?
				texto << "type=#{ramal.tipo}\n"  unless ramal.tipo.blank?
				texto << "username=#{ramal.username}\n"  unless ramal.username.blank?
				texto << "secret=#{ramal.secret}\n"  unless ramal.secret.blank?
				texto << "canreinvite=#{ramal.canreinvite}\n"  unless ramal.canreinvite.blank?
				texto << "host=#{ramal.host}\n"  unless ramal.host.blank?
				texto << "context=#{ramal.context}\n"  unless ramal.context.blank?
				texto << "dtmfmode=#{ramal.dtmfmode}\n"  unless ramal.dtmfmode.blank?
				texto << "call-limit=#{ramal.call_limit}\n"  unless ramal.call_limit.blank?
				texto << "nat=#{ramal.nat}\n" unless ramal.nat.blank?
				texto << "language=pt_BR\n"
				texto << "disallow=all\n"
				texto << "allow=ulaw,alaw,gsm\n\n"
			end
		end

		iax.write texto
		iax.close

		# Reload Asterisk
		`asterisk -x 'iax2 reload'`	
	rescue Exception => e
		p '*'*100
		p e.inspect
	 	flash[:info] = "Não foi possível guardar os dados na iax.conf"
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
	 	voice_backup = File.readlines('/etc/asterisk/voicemail.conf.bak')
		sip =  File.open('/etc/asterisk/voicemail.conf','w+')
		text = voice_backup
		text << "[LOCAL]\n"
		
		object_box.each do |box|
			text << "#{box.ramal.ramal} => #{box.descricao}\n"
		end

		sip.puts text
		sip.close	

		# Reload Asterisk
		`asterisk -x 'voicemail reload'`			 	
	 rescue Exception => e
	 	flash[:info] = "Não foi possível guardar os dados na voicemail.conf"
	 end  	
  end

end
