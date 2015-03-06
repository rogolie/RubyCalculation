class Api::Point2CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Point2_card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Point2_card.all
      render json:@cards
    end
  end


  # GET /cards/new
  def new
    @Card = Point2_card.new
  end

  def top
    @card = Point2_card.last
    render json: @card
  end
  # GET /cards/2/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @Point2_card = Point2_card.new(Point2_card_params)

    respond_to do |format|
      if @Point2_card.save
        format.html { redirect_to @Point2_card, notice: 'Point2_card was successfully created.' }
        format.json { render :show, status: :created, location: @Point2_card }
      else
        format.html { render :new }
        format.json { render json: @Point2_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Point2_cards/2
  # PATCH/PUT /Point2_cards/2.json
  def update
    respond_to do |format|
      if @Point2_card.update(Point2_card_params)
        format.html { redirect_to @Point2_card, notice: 'Point2_card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Point2_card }
      else
        format.html { render :edit }
        format.json { render json: @Point2_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Point2_cards/2
  # DELETE /Point2_cards/2.json
  def destroy
    @Point2_card.destroy
    respond_to do |format|
      format.html { redirect_to Point2_cards_url, notice: 'Point2_card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Point2_card
      @Point2_card = Point2_card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Point2_card_params
      params.require(:Point2_card).permit(:Point2_card_id, :value, :suit)
    end
end
