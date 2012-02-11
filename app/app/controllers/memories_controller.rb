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

  # GET /memories/new
  # GET /memories/new.json
  def new
    @memory = Memory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @memory }
    end
  end

  # GET /memories/1/edit
  def edit
    @memory = Memory.find(params[:id])
  end

  # POST /memories
  # POST /memories.json
  def create
    @memory = Memory.new(params[:memory])

    respond_to do |format|
      if @memory.save
        format.html { redirect_to @memory, notice: 'Memory was successfully created.' }
        format.json { render json: @memory, status: :created, location: @memory }
      else
        format.html { render action: "new" }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /memories/1
  # PUT /memories/1.json
  def update
    @memory = Memory.find(params[:id])

    respond_to do |format|
      if @memory.update_attributes(params[:memory])
        format.html { redirect_to @memory, notice: 'Memory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memories/1
  # DELETE /memories/1.json
  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy

    respond_to do |format|
      format.html { redirect_to memories_url }
      format.json { head :no_content }
    end
  end
end
