class MonitoramentosController < ApplicationController
  before_filter :comandos, :only => [:index,:ajax]
  # GET /monitoramentos
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  def ajax
  	render :partial => 'monitoramento'
  end
  
  private
  def comandos
	  @sip      = `asterisk -x 'sip show users'`
    @iax      = `asterisk -x 'iax2 show peers'`
  	@peers    = `asterisk -x 'sip show peers'`
   	@channels = `asterisk -x 'core show channels'`	
    @voicemail= `asterisk -x 'voicemail show users for LOCAL'`
  end  
   
end
