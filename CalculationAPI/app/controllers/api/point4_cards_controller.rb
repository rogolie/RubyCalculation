class Api::Point4CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Point4_card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Point4_card.all
      render json:@cards
    end
  end


  # GET /cards/new
  def new
    @Card = Point4_card.new
  end

  def top
    @card = Point4_card.last
    render json: @card
  end
  # GET /cards/4/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @Point4_card = Point4_card.new(Point4_card_params)

    respond_to do |format|
      if @Point4_card.save
        format.html { redirect_to @Point4_card, notice: 'Point4_card was successfully created.' }
        format.json { render :show, status: :created, location: @Point4_card }
      else
        format.html { render :new }
        format.json { render json: @Point4_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Point4_cards/4
  # PATCH/PUT /Point4_cards/4.json
  def update
    respond_to do |format|
      if @Point4_card.update(Point4_card_params)
        format.html { redirect_to @Point4_card, notice: 'Point4_card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Point4_card }
      else
        format.html { render :edit }
        format.json { render json: @Point4_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Point4_cards/4
  # DELETE /Point4_cards/4.json
  def destroy
    @Point4_card.destroy
    respond_to do |format|
      format.html { redirect_to Point4_cards_url, notice: 'Point4_card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Point4_card
      @Point4_card = Point4_card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Point4_card_params
      params.require(:Point4_card).permit(:Point4_card_id, :value, :suit)
    end
end
