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
end
