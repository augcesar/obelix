class IaxController < ApplicationController
 after_filter :salvar_dados_conf, :only => [:create, :update, :delete]
  # GET /iax
  # GET /iax.json
  def index
    @iax = Iax.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @iax }
    end
  end

  # GET /iax/1
  # GET /iax/1.json
  def show
    @iax = Iax.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iax }
    end
  end

  # GET /iax/new
  # GET /iax/new.json
  def new
    @iax = Iax.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @iax }
    end
  end

  # GET /iax/1/edit
  def edit
    @iax = Iax.find(params[:id])
  end

  # POST /iax
  # POST /iax.json
  def create
    @iax = Iax.new(params[:iax])

    respond_to do |format|
      if @iax.save
        format.html { redirect_to @iax, notice: 'Iax criado com sucesso!' }
        format.json { render json: @iax, status: :created, location: @iax }
      else
        format.html { render action: "new" }
        format.json { render json: @iax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /iax/1
  # PUT /iax/1.json
  def update
    @iax = Iax.find(params[:id])

    respond_to do |format|
      if @iax.update_attributes(params[:iax])
        format.html { redirect_to @iax, notice: 'Iax alterado com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iax/1
  # DELETE /iax/1.json
  def destroy
    @iax = Iax.find(params[:id])
    @iax.destroy

    respond_to do |format|
      format.html { redirect_to iax_index_url }
      format.json { head :no_content }
    end
  end
  private
  def salvar_dados_conf    
    # Guardar Dados
    guardar_iax_ramal_conf(Iax.all,Ramal.all)
    # 
  end   
end
