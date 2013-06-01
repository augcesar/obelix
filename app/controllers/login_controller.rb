class LoginController < ApplicationController
  # GET /login
  # GET /login.json
  def index
    @login = Login.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @login }
    end
  end

  # GET /login/1
  # GET /login/1.json
  def show
    @login = Login.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @login }
    end
  end

  # GET /login/new
  # GET /login/new.json
  def new
    @login = Login.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @login }
    end
  end

  # GET /login/1/edit
  def edit
    @login = Login.find(params[:id])
  end

  # POST /login
  # POST /login.json
  def create
    @login = Login.new(params[:login])

    respond_to do |format|
      if @login.save
        format.html { redirect_to @login, notice: 'Login was successfully created.' }
        format.json { render json: @login, status: :created, location: @login }
      else
        format.html { render action: "new" }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /login/1
  # PUT /login/1.json
  def update
    @login = Login.find(params[:id])

    respond_to do |format|
      if @login.update_attributes(params[:login])
        format.html { redirect_to @login, notice: 'Login was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /login/1
  # DELETE /login/1.json
  def destroy
    @login = Login.find(params[:id])
    @login.destroy

    respond_to do |format|
      format.html { redirect_to login_index_url }
      format.json { head :no_content }
    end
  end
end
