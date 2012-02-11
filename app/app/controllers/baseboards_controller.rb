class BaseboardsController < ApplicationController
  # GET /baseboards
  # GET /baseboards.json
  def index
    @baseboards = Baseboard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @baseboards }
    end
  end

  # GET /baseboards/1
  # GET /baseboards/1.json
  def show
    @baseboard = Baseboard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @baseboard }
    end
  end

  # GET /baseboards/new
  # GET /baseboards/new.json
  def new
    @baseboard = Baseboard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @baseboard }
    end
  end

  # GET /baseboards/1/edit
  def edit
    @baseboard = Baseboard.find(params[:id])
  end

  # POST /baseboards
  # POST /baseboards.json
  def create
    @baseboard = Baseboard.new(params[:baseboard])

    respond_to do |format|
      if @baseboard.save
        format.html { redirect_to @baseboard, notice: 'Baseboard was successfully created.' }
        format.json { render json: @baseboard, status: :created, location: @baseboard }
      else
        format.html { render action: "new" }
        format.json { render json: @baseboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /baseboards/1
  # PUT /baseboards/1.json
  def update
    @baseboard = Baseboard.find(params[:id])

    respond_to do |format|
      if @baseboard.update_attributes(params[:baseboard])
        format.html { redirect_to @baseboard, notice: 'Baseboard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @baseboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baseboards/1
  # DELETE /baseboards/1.json
  def destroy
    @baseboard = Baseboard.find(params[:id])
    @baseboard.destroy

    respond_to do |format|
      format.html { redirect_to baseboards_url }
      format.json { head :no_content }
    end
  end
end
