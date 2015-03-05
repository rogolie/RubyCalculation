class Api::Point1CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Point1_card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Point1_card.all
      render json:@cards
    end
  end


  # GET /cards/new
  def new
    @Card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @Point1_card = Point1_card.new(Point1_card_params)

    respond_to do |format|
      if @Point1_card.save
        format.html { redirect_to @Point1_card, notice: 'Point1_card was successfully created.' }
        format.json { render :show, status: :created, location: @Point1_card }
      else
        format.html { render :new }
        format.json { render json: @Point1_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Point1_cards/1
  # PATCH/PUT /Point1_cards/1.json
  def update
    respond_to do |format|
      if @Point1_card.update(Point1_card_params)
        format.html { redirect_to @Point1_card, notice: 'Point1_card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Point1_card }
      else
        format.html { render :edit }
        format.json { render json: @Point1_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Point1_cards/1
  # DELETE /Point1_cards/1.json
  def destroy
    @Point1_card.destroy
    respond_to do |format|
      format.html { redirect_to Point1_cards_url, notice: 'Point1_card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Point1_card
      @Point1_card = Point1_card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Point1_card_params
      params.require(:Point1_card).permit(:Point1_card_id, :value, :suit)
    end
end
