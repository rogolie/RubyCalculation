require_relative('../../lib/APILogic.rb')

class LogicController < ApplicationController

  skip_before_action :verify_authenticity_token

  def move
    pile1 = params[:pile1].downcase
    pile2 = params[:pile2].downcase
    APILogic.moveTopCard(pile1, pile2,true)
    #do game end checking here
    render json: {}, status: :ok
  end

  def new_game
    APILogic.newGame
    render json: {}, status: :ok
  end
  
  def undo    
    @move = APILogic.getLastMove
    unless @move.nil?
      APILogic.moveTopCard(@move.destination, @move.source, false)
      APILogic.deleteLastMove
    end
    render json: {}, status: :ok
  end

end
