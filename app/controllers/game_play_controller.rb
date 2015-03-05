class GamePlayController < ApplicationController

  helper_method :moveToF2
  $cards = [1,2,3,4,5,6,7,8,9,10,11,12]
  $found1 = []
  $found2 = []
  $found3 = []
  $found4 = []
  $cardsFromDB = Card.all

  def index

  end

  def moveToF1
    if ($cards.last).modulo(1) == 0
      $found1 << $cards.last
      $cards.pop
    end
    redirect_to game_play_index_path
  end

  def moveToF2
    if ($cards.last).modulo(2) == 0
      $found2 << $cards.last
      $cards.pop
    end
    redirect_to game_play_index_path
  end

  def moveToF3
    if ($cards.last).modulo(3) == 0
      $found3 << $cards.last
      $cards.pop
    end
    redirect_to game_play_index_path
  end

  def moveToF4
    if ($cards.last).modulo(4) == 0
      $found4 << $cards.last
      $cards.pop
    end
    redirect_to game_play_index_path
  end

end
