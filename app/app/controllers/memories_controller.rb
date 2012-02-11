class MemoriesController < ApplicationController
  # GET /memories
  # GET /memories.json
  def index
    @memories = Memory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @memories }
    end
  end

  # GET /memories/1
  # GET /memories/1.json
  def show
    @memory = Memory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @memory }
    end
  end
end
