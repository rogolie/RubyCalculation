class Api::Waste1CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Waste1Card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Waste1Card.all
      render json:@cards
    end
  end
  
  def top
    @card = Waste1Card.last
    render json: @card
  end
  
  def show
    
  end

  # GET /cards/new
  def new
    @Card = Waste1Card.new
  end

  def top
    @card = Waste1Card.last
    render json: @card
  end
  # GET /cards/4/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @Waste1Card = Waste1Card.create(:card_id => params[:card_id], :value => params[:value], :suit => params[:suit])

    respond_to do |format|
      if @Waste1Card.save
        format.html {}
        format.json { render :show, status: :created, location: @Deck_card }
      else
        format.html { render :new }
        format.json { render json: @Deck_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Waste1Cards/4
  # PATCH/PUT /Waste1Cards/4.json
  def update
    respond_to do |format|
      if @Waste1Card.update(Waste1Card_params)
        format.html { redirect_to @Waste1Card, notice: 'Waste1Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Waste1Card }
      else
        format.html { render :edit }
        format.json { render json: @Waste1Card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Waste1Cards/4
  # DELETE /Waste1Cards/4.json
  def destroy
    if(params[:card_id].blank?)
      @Waste1Cards = Waste1Card.all
      @Waste1Cards.destroy
    else
      @Waste1Card = Waste1Card.find_by_card_id(params[:card_id])
      @Waste1Card.destroy
    end
    respond_to do |format|
      format.html { redirect_to Waste1Cards_url, notice: 'Waste1Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Waste1Card
      @Waste1Card = Waste1Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Waste1Card_params
      params.require(:Waste1Card).permit(:card_id, :value, :suit)
    end
end
