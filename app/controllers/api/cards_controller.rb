class Api::CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Card.all
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
    @Card = Card.new(Card_params)

    respond_to do |format|
      if @Card.save
        format.html { redirect_to @Card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @Card }
      else
        format.html { render :new }
        format.json { render json: @Card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @Card.update(Card_params)
        format.html { redirect_to @Card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Card }
      else
        format.html { render :edit }
        format.json { render json: @Card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @Card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Card
      @Card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Card_params
      params.require(:Card).permit(:card_id, :value, :suit)
    end
end
