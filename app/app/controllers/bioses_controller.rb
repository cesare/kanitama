class BiosesController < ApplicationController
  # GET /bioses
  # GET /bioses.json
  def index
    @bioses = Bios.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bioses }
    end
  end

  # GET /bioses/1
  # GET /bioses/1.json
  def show
    @bios = Bios.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bios }
    end
  end

  # GET /bioses/new
  # GET /bioses/new.json
  def new
    @bios = Bios.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bios }
    end
  end

  # GET /bioses/1/edit
  def edit
    @bios = Bios.find(params[:id])
  end

  # POST /bioses
  # POST /bioses.json
  def create
    @bios = Bios.new(params[:bios])

    respond_to do |format|
      if @bios.save
        format.html { redirect_to @bios, notice: 'Bios was successfully created.' }
        format.json { render json: @bios, status: :created, location: @bios }
      else
        format.html { render action: "new" }
        format.json { render json: @bios.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bioses/1
  # PUT /bioses/1.json
  def update
    @bios = Bios.find(params[:id])

    respond_to do |format|
      if @bios.update_attributes(params[:bios])
        format.html { redirect_to @bios, notice: 'Bios was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bios.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bioses/1
  # DELETE /bioses/1.json
  def destroy
    @bios = Bios.find(params[:id])
    @bios.destroy

    respond_to do |format|
      format.html { redirect_to bioses_url }
      format.json { head :no_content }
    end
  end
end
