class PlanosDiscagensController < ApplicationController
  after_filter :salvar_dados_conf, :only => [:create, :update, :delete]
  # GET /planos_discagens
  # GET /planos_discagens.json
  def index
    @planos_discagens = PlanoDiscagem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @planos_discagens }
    end
  end

  # GET /planos_discagens/1
  # GET /planos_discagens/1.json
  def show
    @plano_discagem = PlanoDiscagem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plano_discagem }
    end
  end

  # GET /planos_discagens/new
  # GET /planos_discagens/new.json
  def new
    @plano_discagem = PlanoDiscagem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @plano_discagem }
    end
  end

  # GET /planos_discagens/1/edit
  def edit
    @plano_discagem = PlanoDiscagem.find(params[:id])
  end

  # POST /planos_discagens
  # POST /planos_discagens.json
  def create
    @plano_discagem = PlanoDiscagem.new(params[:plano_discagem])

    respond_to do |format|
      if @plano_discagem.save
        format.html { redirect_to @plano_discagem, notice: 'Plano discagem criado com sucesso!' }
        format.json { render json: @plano_discagem, status: :created, location: @plano_discagem }
      else
        format.html { render action: "new" }
        format.json { render json: @plano_discagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /planos_discagens/1
  # PUT /planos_discagens/1.json
  def update
    @plano_discagem = PlanoDiscagem.find(params[:id])

    respond_to do |format|
      if @plano_discagem.update_attributes(params[:plano_discagem])
        format.html { redirect_to @plano_discagem, notice: 'Plano discagem alterado com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plano_discagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planos_discagens/1
  # DELETE /planos_discagens/1.json
  def destroy
    @plano_discagem = PlanoDiscagem.find(params[:id])
    @plano_discagem.destroy

    respond_to do |format|
      format.html { redirect_to planos_discagens_url }
      format.json { head :no_content }
    end
  end

  private
  def salvar_dados_conf    
    # Guardar Dados
    guardar_extensao_conf(PlanoDiscagem.first)
    # 
  end 
end
