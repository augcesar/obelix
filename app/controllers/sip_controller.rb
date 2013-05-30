class SipController < ApplicationController
  after_filter :salvar_dados_conf, :only => [:create, :update, :delete]
 
  # GET /sip
  # GET /sip.json

  def index
    @sip = Sip.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sip }
    end
  end

  # GET /sip/1
  # GET /sip/1.json
  def show
    @sip = Sip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sip }
    end
  end

  # GET /sip/new
  # GET /sip/new.json
  def new
    @sip = Sip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sip }
    end
  end

  # GET /sip/1/edit
  def edit
    @sip = Sip.find(params[:id])
  end

  # POST /sip
  # POST /sip.json
  def create
    @sip = Sip.new(params[:sip])

    respond_to do |format|
      if @sip.save
        format.html { redirect_to @sip, notice: 'Sip was successfully created.' }
        format.json { render json: @sip, status: :created, location: @sip }
      else
        format.html { render action: "new" }
        format.json { render json: @sip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sip/1
  # PUT /sip/1.json
  def update
    @sip = Sip.find(params[:id])

    respond_to do |format|
      if @sip.update_attributes(params[:sip])
        format.html { redirect_to @sip, notice: 'Sip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sip/1
  # DELETE /sip/1.json
  def destroy
    @sip = Sip.find(params[:id])
    @sip.destroy

    respond_to do |format|
      format.html { redirect_to sip_index_url }
      format.json { head :no_content }
    end
  end

  private
  def salvar_dados_conf    
    # Guardar Dados
    guardar_sip_ramal_conf(Sip.all,Ramal.all)
    # 
  end
end
