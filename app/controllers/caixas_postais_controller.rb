class CaixasPostaisController < ApplicationController
  # GET /caixas_postais
  # GET /caixas_postais.json
  def index
    @caixas_postais = CaixaPostal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caixas_postais }
    end
  end

  # GET /caixas_postais/1
  # GET /caixas_postais/1.json
  def show
    @caixa_postal = CaixaPostal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caixa_postal }
    end
  end

  # GET /caixas_postais/new
  # GET /caixas_postais/new.json
  def new
    @caixa_postal = CaixaPostal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caixa_postal }
    end
  end

  # GET /caixas_postais/1/edit
  def edit
    @caixa_postal = CaixaPostal.find(params[:id])
  end

  # POST /caixas_postais
  # POST /caixas_postais.json
  def create
    @caixa_postal = CaixaPostal.new(params[:caixa_postal])

    respond_to do |format|
      if @caixa_postal.save
        format.html { redirect_to @caixa_postal, notice: 'Caixa postal was successfully created.' }
        format.json { render json: @caixa_postal, status: :created, location: @caixa_postal }
      else
        format.html { render action: "new" }
        format.json { render json: @caixa_postal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /caixas_postais/1
  # PUT /caixas_postais/1.json
  def update
    @caixa_postal = CaixaPostal.find(params[:id])

    respond_to do |format|
      if @caixa_postal.update_attributes(params[:caixa_postal])
        format.html { redirect_to @caixa_postal, notice: 'Caixa postal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @caixa_postal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caixas_postais/1
  # DELETE /caixas_postais/1.json
  def destroy
    @caixa_postal = CaixaPostal.find(params[:id])
    @caixa_postal.destroy

    respond_to do |format|
      format.html { redirect_to caixas_postais_url }
      format.json { head :no_content }
    end
  end
end
