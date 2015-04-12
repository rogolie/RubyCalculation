class Api::Point3CardsController < ApplicationController

  # GET /cards
  # GET /cards.json
  def index
    if(params.has_key? :card_id)
      @card = Point3Card.where(:card_id=>params[:card_id])
      render json:@card

    else
      @cards = Point3Card.all
      render json:@cards
    end
  end
  
  def top
    @card = Point3Card.last
    render json: @card
  end

  # GET /cards/new
  def new
    @Card = Point3Card.new
  end

  def top
    @card = Point3Card.last
    render json: @card
  end

  def show
  end

  # GET /cards/3/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @Point3Card = Point3Card.create(:card_id => params[:card_id], :value => params[:value], :suit => params[:suit])

      if @Point3Card.save
        render json: {}, status: :created
      else
        render json: @Point3Card.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /Point3Cards/3
  # PATCH/PUT /Point3Cards/3.json
  def update
    respond_to do |format|
      if @Point3Card.update(Point3Card_params)
        format.html { redirect_to @Point3Card, notice: 'Point3Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @Point3Card }
      else
        format.html { render :edit }
        format.json { render json: @Point3Card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Point3Cards/3
  # DELETE /Point3Cards/3.json
  def destroy
    if(params.has_key?(:card_id))
      @Point3Card = Point3Card.find_by_card_id(params[:card_id])
      @Point3Card.destroy
    elsif(params.has_key?(:id))
      @Point3Card = Point3Card.find_by_card_id(params[:id])
      @Point3Card.destroy
    else
      Point3Card.delete_all
    end
    render json: {}, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Point3Card
      @Point3Card = Point3Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Point3Card_params
      params.require(:Point3Card).permit(:card_id, :value, :suit)
    end
end
