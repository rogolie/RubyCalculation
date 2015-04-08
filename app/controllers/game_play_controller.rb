require_relative('../../lib/APILogic.rb')
class GamePlayController < ApplicationController


  # There's probably a better way of doing this.
  # In order NOT to reset the game on a manual page refresh, I'm checking this variable.
  # The variable is set in the findFoundationCards method


  before_filter :setMyVars
  def setMyVars

     $firstLoad = 0

      #$cards = [1,2,3,4,5,6,7,8,9,10,11,12]
      $cards = []
      $found1 = [ APILogic.getTopCard("point1")]
      $found2 = [ APILogic.getTopCard("point2")]
      $found3 = [ APILogic.getTopCard("point3")]
      $found4 = [ APILogic.getTopCard("point4")]
      $waste1 =  APILogic.getAllCards("waste1")
      $waste2 =  APILogic.getAllCards("waste2")
      $waste3 =  APILogic.getAllCards("waste3")
      $waste4 =  APILogic.getAllCards("waste4")
      #$fndSetup = []
      $cards = APILogic.getAllCards("deck")
     #findFoundationCards


  end

  #$cards is the deck

  def index
    #$cards = APILogic.getAllCards("deck")
    #APILogic.moveTopCard("deck", "waste1")
    
      #findFoundationCards

  end

  def moveMyCard(foundStack,stackStep)
    if foundStack.last != nil
      $fTemp = foundStack.last.value.to_i
      $cTemp = $cards.last.value.to_i

      if $fTemp + stackStep > 14
        $fTemp -= 13
      end
      if $cTemp == $fTemp + stackStep
        foundStack << $cards.last
        $cards.pop
      end
    end
  end

  def newGame()
    APILogic.newGame()
    redirect_to game_play_index_path
  end

  def moveToF1
    moveMyCard($found1,1)
    APILogic.moveTopCard("deck", "point1")
    redirect_to game_play_index_path

  end

  def moveToF2
    moveMyCard($found2,2)
    APILogic.moveTopCard("deck", "point2")
    redirect_to game_play_index_path
  end

  def moveToF3
    moveMyCard($found3,3)
    APILogic.moveTopCard("deck", "point3")
    redirect_to game_play_index_path
  end

  def moveToF4
    APILogic.moveTopCard("deck", "point4")
    moveMyCard($found4,4)
    redirect_to game_play_index_path
  end

  def moveToW1
    APILogic.moveTopCard("deck", "waste1")
    $waste1 << $cards.last
    $cards.pop
    redirect_to game_play_index_path
  end

  def moveToW2
    APILogic.moveTopCard("deck", "waste2")
    $waste2 << $cards.last
    $cards.pop
    redirect_to game_play_index_path
  end

  def moveToW3
    APILogic.moveTopCard("deck", "waste3")
    $waste3 << $cards.last
    $cards.pop
    redirect_to game_play_index_path
  end

  def moveToW4
    APILogic.moveTopCard("deck", "waste4")
    $waste4 << $cards.last
    $cards.pop
    redirect_to game_play_index_path
  end

  # private
  #   def findFoundationCards
  #     if $firstLoad == 0
  #       $foundem = []
  #       $foundemall = 0
  #       $cards.each { |card|
  #         if $foundemall == 4
  #           break
  #         end
  #         if card.value.to_i == 14 && $foundem[0] == nil
  #           $found1 << card
  #           $cards.delete(card)
  #           $foundem[0] = card
  #           $foundemall += 1
  #         end
  #         if card.value.to_i == 2 && $foundem[1] == nil
  #           $found2 << card
  #           $cards.delete(card)
  #           $foundem[1] = card
  #           $foundemall += 1
  #         end
  #         if card.value.to_i == 3 && $foundem[2] == nil
  #           $found3 << card
  #           $cards.delete(card)
  #           $foundem[2] = card
  #           $foundemall += 1
  #         end
  #         if card.value.to_i == 4 && $foundem[3] == nil
  #           $found4 << card
  #           $cards.delete(card)
  #           $foundem[3] = card
  #           $foundemall += 1
  #         end
  #       }
  #     end
  #     $firstLoad  = $firstLoad + 1
  #   end

end
