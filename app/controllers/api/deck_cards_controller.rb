class Api::DeckCardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Deck_card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Deck_card.all
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
    @Deck_card = Deck_card.new(Deck_card_params)

    respond_to do |format|
      if @Deck_card.save
        format.html { redirect_to @Deck_card, notice: 'Deck_card was successfully created.' }
        format.json { render :show, status: :created, location: @Deck_card }
      else
        format.html { render :new }
        format.json { render json: @Deck_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Deck_cards/1
  # PATCH/PUT /Deck_cards/1.json
  def update
    respond_to do |format|
      if @Deck_card.update(Deck_card_params)
        format.html { redirect_to @Deck_card, notice: 'Deck_card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Deck_card }
      else
        format.html { render :edit }
        format.json { render json: @Deck_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Deck_cards/1
  # DELETE /Deck_cards/1.json
  def destroy
    @Deck_card.destroy
    respond_to do |format|
      format.html { redirect_to Deck_cards_url, notice: 'Deck_card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Deck_card
      @Deck_card = Deck_card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Deck_card_params
      params.require(:Deck_card).permit(:Deck_card_id, :value, :suit)
    end
end
