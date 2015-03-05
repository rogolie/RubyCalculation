class Api::Point3CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Point3_card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Point3_card.all
      render json:@cards
    end
  end


  # GET /cards/new
  def new
    @Card = Card.new
  end

  # GET /cards/3/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @Point3_card = Point3_card.new(Point3_card_params)

    respond_to do |format|
      if @Point3_card.save
        format.html { redirect_to @Point3_card, notice: 'Point3_card was successfully created.' }
        format.json { render :show, status: :created, location: @Point3_card }
      else
        format.html { render :new }
        format.json { render json: @Point3_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Point3_cards/3
  # PATCH/PUT /Point3_cards/3.json
  def update
    respond_to do |format|
      if @Point3_card.update(Point3_card_params)
        format.html { redirect_to @Point3_card, notice: 'Point3_card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Point3_card }
      else
        format.html { render :edit }
        format.json { render json: @Point3_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Point3_cards/3
  # DELETE /Point3_cards/3.json
  def destroy
    @Point3_card.destroy
    respond_to do |format|
      format.html { redirect_to Point3_cards_url, notice: 'Point3_card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Point3_card
      @Point3_card = Point3_card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Point3_card_params
      params.require(:Point3_card).permit(:Point3_card_id, :value, :suit)
    end
end
