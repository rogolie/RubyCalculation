class Api::Point1CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Point1Card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Point1Card.all
      render json:@cards
    end
  end
  
  def top
    @card = Point1Card.last
    render json: @card
  end

  # GET /cards/new
  def new
    @Card = Point1Card.new
  end

  def top
    @card = Point1Card.last
    render json: @card
  end

  def show
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @Point1Card = Point1Card.create(:card_id => params[:card_id], :value => params[:value], :suit => params[:suit])

      if @Point1Card.save
        render json: {}, status: :created
      else
        render json: @Point1Card.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /Point1Cards/1
  # PATCH/PUT /Point1Cards/1.json
  def update
    respond_to do |format|
      if @Point1Card.update(Point1Card_params)
        format.html { redirect_to @Point1Card, notice: 'Point1Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Point1Card }
      else
        format.html { render :edit }
        format.json { render json: @Point1Card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Point1Cards/1
  # DELETE /Point1Cards/1.json
   def destroy
    if(params.has_key?(:card_id))
      @Point1Card = Point1Card.find_by_card_id(params[:card_id])
      @Point1Card.destroy
    elsif(params.has_key?(:id))
      @Point1Card = Point1Card.find_by_card_id(params[:id])
      @Point1Card.destroy
    else
      Point1Card.delete_all
    end
    render json: {}, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Point1Card
      @Point1Card = Point1Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Point1Card_params
      params.require(:Point1Card).permit(:card_id, :value, :suit)
    end
end
