class Api::DeckCardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    @cards = DeckCard.all
    respond_to do |format|
      format.json {render :json => @cards}
      format.html {render :json =>@cards}
    end
  end


  # GET /cards/new
  def new
    @card = DeckCard.new
  end

  def top
    @card = DeckCard.last
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
    @Deck_card = DeckCard.create(:card_id => params[:card_id], :value => params[:value], :suit => params[:suit])
      if @Deck_card.save
        render json: {}, status: :created
      else
        render json: @DeckCard.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /Deck_cards/1
  # PATCH/PUT /Deck_cards/1.json
  def update
    respond_to do |format|
      if @Deck_card.update(Deck_card_params)
        format.html {}
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
    if(params.has_key?(:card_id))
      @Deck_card = DeckCard.find_by_card_id(params[:card_id])
      @Deck_card.destroy
    else
      DeckCard.delete_all
    end
    render json: {}, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Deck_card
      @Deck_card = DeckCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Deck_card_params
      params.require(:Deck_card).permit(:card_id, :value, :suit)
    end
end