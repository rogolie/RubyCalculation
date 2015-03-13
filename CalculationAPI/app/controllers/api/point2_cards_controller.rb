class Api::Point2CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Point2Card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Point2Card.all
      render json:@cards
    end
  end
  
  def show
    
  end
  
  def top
    @card = Point2Card.last
    render json: @card
  end


  # GET /cards/new
  def new
    @Card = Point2Card.new
  end

  def top
    @card = Point2Card.last
    render json: @card
  end
  # GET /cards/2/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @Point2Card = Point2Card.create(:card_id => params[:card_id], :value => params[:value], :suit => params[:suit])

      if @Point2Card.save
        render json: {}, status: :created
      else
        render json: @Point2Card.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /Point2Cards/2
  # PATCH/PUT /Point2Cards/2.json
  def update
    respond_to do |format|
      if @Point2Card.update(Point2Card_params)
        format.html { redirect_to @Point2Card, notice: 'Point2Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Point2Card }
      else
        format.html { render :edit }
        format.json { render json: @Point2Card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Point2Cards/2
  # DELETE /Point2Cards/2.json
  def destroy
    if(params.has_key?(:card_id))
      @Point2Card = Point2Card.find_by_card_id(params[:card_id])
      @Point2Card.destroy
    else
      Point2Card.delete_all
    end
    render json: {}, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Point2Card
      @Point2Card = Point2Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Point2Card_params
      params.require(:Point2Card).permit(:card_id, :value, :suit)
    end
end
