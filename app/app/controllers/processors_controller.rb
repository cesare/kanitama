class ProcessorsController < ApplicationController
  # GET /processors
  # GET /processors.json
  def index
    @processors = Processor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @processors }
    end
  end

  # GET /processors/1
  # GET /processors/1.json
  def show
    @processor = Processor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @processor }
    end
  end
end
