class Api::Point4CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Point4Card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Point4Card.all
      render json:@cards
    end
  end

  def top
    @card = Point4Card.last
    render json: @card
  end
  
  def show
    
  end


  # GET /cards/new
  def new
    @Card = Point4Card.new
  end

  def top
    @card = Point4Card.last
    render json: @card
  end
  # GET /cards/4/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @Point4Card = Point4Card.create(:card_id => params[:card_id], :value => params[:value], :suit => params[:suit])

      if @Point4Card.save
        render json: {}, status: :created
      else
        render json: @Point4Card.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /Point4Cards/4
  # PATCH/PUT /Point4Cards/4.json
  def update
    respond_to do |format|
      if @Point4Card.update(Point4Card_params)
        format.html { redirect_to @Point4Card, notice: 'Point4Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Point4Card }
      else
        format.html { render :edit }
        format.json { render json: @Point4Card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Point4Cards/4
  # DELETE /Point4Cards/4.json
  def destroy
    if(params.has_key?(:card_id))
      @Point4Card = Point4Card.find_by_card_id(params[:card_id])
      @Point4Card.destroy
    else
      Point4Card.delete_all
    end
    render json: {}, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Point4Card
      @Point4Card = Point4Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Point4Card_params
      params.require(:Point4Card).permit(:card_id, :value, :suit)
    end
end
