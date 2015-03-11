class Api::Waste3CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Waste3Card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Waste3Card.all
      render json:@cards
    end
  end
  
  def top
    @card = Waste3Card.last
    render json: @card
  end
  
  def show
    
  end

  # GET /cards/new
  def new
    @Card = Waste3Card.new
  end

  def top
    @card = Waste3Card.last
    render json: @card
  end
  # GET /cards/4/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @Waste3Card = Waste3Card.create(:card_id => params[:card_id], :value => params[:value], :suit => params[:suit])

      if @Waste3Card.save
        render json: {}, status: :created
      else
        render json: @Waste3Card.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /Waste3Cards/4
  # PATCH/PUT /Waste3Cards/4.json
  def update
    respond_to do |format|
      if @Waste3Card.update(Waste3Card_params)
        format.html { redirect_to @Waste3Card, notice: 'Waste3Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Waste3Card }
      else
        format.html { render :edit }
        format.json { render json: @Waste3Card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Waste3Cards/4
  # DELETE /Waste3Cards/4.json
  def destroy
    if(params.has_key?(:card_id))
      @Waste3Card = Waste3Card.find_by_card_id(params[:card_id])
      @Waste3Card.destroy
    else
      Waste3Card.delete_all
    end
    render json: {}, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Waste3Card
      @Waste3Card = Waste3Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Waste3Card_params
      params.require(:Waste3Card).permit(:card_id, :value, :suit)
    end
end
