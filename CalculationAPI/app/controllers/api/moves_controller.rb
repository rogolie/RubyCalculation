class Api::MovesController < ApplicationController

  def index
      @moves = Move.all
      render json:@moves
  end
  
  def last
    @move = Move.last
    render json: @move
  end

  # GET /moves/new
  def new
    @move = Move.new
  end

  def show
  end

  # GET /moves/1/edit
  def edit
  end

  # POST /moves
  # POST /moves.json
  def create
    @Move = Move.create(:source => params[:source], :destination => params[:destination])

      if @Move.save
        render json: {}, status: :created
      else
        render json: @Move.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /Moves/1
  # PATCH/PUT /Moves/1.json
  def update
    respond_to do |format|
      if @Move.update(Move_params)
        format.html { redirect_to @Move, notice: 'move was successfully updated.' }
        format.json { render :show, status: :ok, location: @Point1Card }
      else
        format.html { render :edit }
        format.json { render json: @Move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Moves
  def destroy
    Move.delete_all
    render json: {}, status: :no_content
  end
  
  # DELETE /Moves/last
  def destroyLast
    @Move = Move.last
    @Move.destroy
    render json: {}, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Move
      @Move = Move.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Point1Card_params
      params.require(:Move).permit(:source, :destination)
    end
end
