class RamaisController < ApplicationController
  after_filter :salvar_dados_conf, :only => [:create, :update, :delete]

  # GET /ramais
  # GET /ramais.json
  def index
    @ramais = Ramal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ramais }
    end
  end

  # GET /ramais/1
  # GET /ramais/1.json
  def show
    @ramal = Ramal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ramal }
    end
  end

  # GET /ramais/new
  # GET /ramais/new.json
  def new
    @ramal = Ramal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ramal }
    end
  end

  # GET /ramais/1/edit
  def edit
    @ramal = Ramal.find(params[:id])
  end

  # POST /ramais
  # POST /ramais.json
  def create
    @ramal = Ramal.new(params[:ramal])

    respond_to do |format|
      if @ramal.save
        format.html { redirect_to @ramal, notice: 'Ramal criado com sucesso!' }
        format.json { render json: @ramal, status: :created, location: @ramal }
      else
        format.html { render action: "new" }
        format.json { render json: @ramal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ramais/1
  # PUT /ramais/1.json
  def update
    @ramal = Ramal.find(params[:id])

    respond_to do |format|
      if @ramal.update_attributes(params[:ramal])
        format.html { redirect_to @ramal, notice: 'Ramal alterado com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ramal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ramais/1
  # DELETE /ramais/1.json
  def destroy
    @ramal = Ramal.find(params[:id])
    @ramal.destroy

    respond_to do |format|
      format.html { redirect_to ramais_url }
      format.json { head :no_content }
    end
  end
  private
  def salvar_dados_conf    
    # Guardar Dados
    guardar_sip_ramal_conf(Sip.all,Ramal.all)
    guardar_iax_ramal_conf(Iax.all,Ramal.all)
    # 
  end
end
