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
end
