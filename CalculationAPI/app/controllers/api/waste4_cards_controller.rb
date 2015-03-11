class Api::Waste4CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Waste4Card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Waste4Card.all
      render json:@cards
    end
  end
  
  def top
    @card = Waste4Card.last
    render json: @card
  end
  
  def show
    
  end

  # GET /cards/new
  def new
    @Card = Waste4Card.new
  end

  def top
    @card = Waste4Card.last
    render json: @card
  end
  # GET /cards/4/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @Waste4Card = Waste4Card.create(:card_id => params[:card_id], :value => params[:value], :suit => params[:suit])

      if @Waste4Card.save
        render json: {}, status: :created
      else
        render json: @Waste4Card.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /Waste4Cards/4
  # PATCH/PUT /Waste4Cards/4.json
  def update
    respond_to do |format|
      if @Waste4Card.update(Waste4Card_params)
        format.html { redirect_to @Waste4Card, notice: 'Waste4Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Waste4Card }
      else
        format.html { render :edit }
        format.json { render json: @Waste4Card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Waste4Cards/4
  # DELETE /Waste4Cards/4.json
  def destroy
    if(params.has_key?(:card_id))
      @Waste4Card = Waste4Card.find_by_card_id(params[:card_id])
      @Waste4Card.destroy
    else
      Waste4Card.delete_all
    end
    render json: {}, status: :no_content
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Waste4Card
      @Waste4Card = Waste4Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Waste4Card_params
      params.require(:Waste4Card).permit(:card_id, :value, :suit)
    end
end
