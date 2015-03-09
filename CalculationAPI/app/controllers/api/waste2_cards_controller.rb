class Api::Waste2CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Waste2Card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Waste2Card.all
      render json:@cards
    end
  end
  
  def show
    
  end
  
  def top
    @card = Waste2Card.last
    render json: @card
  end

  # GET /cards/new
  def new
    @Card = Waste2Card.new
  end

  def top
    @card = Waste2Card.last
    render json: @card
  end
  # GET /cards/4/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
 def create
    @Waste2Card = Waste2Card.create(:card_id => params[:card_id], :value => params[:value], :suit => params[:suit])

    respond_to do |format|
      if @Waste2Card.save
        format.html {}
        format.json { render :show, status: :created, location: @Waste2Card }
      else
        format.html { render :new }
        format.json { render json: @Waste2Card.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /Waste2Cards/4
  # PATCH/PUT /Waste2Cards/4.json
  def update
    respond_to do |format|
      if @Waste2Card.update(Waste2Card_params)
        format.html { redirect_to @Waste2Card, notice: 'Waste2Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Waste2Card }
      else
        format.html { render :edit }
        format.json { render json: @Waste2Card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Waste2Cards/4
  # DELETE /Waste2Cards/4.json
  def destroy
    if(params[:card_id].blank?)
      @Waste2Cards = Waste2Card.all
      @Waste2Cards.destroy
    else
      @Waste2Card = Waste2Card.find_by_card_id(params[:card_id])
      @Waste2Card.destroy
    end
    respond_to do |format|
      format.html { redirect_to Waste2Cards_url, notice: 'Waste2Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Waste2Card
      @Waste2Card = Waste2Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Waste2Card_params
      params.require(:Waste2Card).permit(:card_id, :value, :suit)
    end
end
