class Api::LogicController < ApplicationController
  def move
    pile1 = params[:pile1]
    pile2 = params[:pile2]
    APILogic.moveTopCard(pile1, pile2)
  end
end