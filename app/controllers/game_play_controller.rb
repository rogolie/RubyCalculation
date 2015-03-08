class GamePlayController < ApplicationController


  # There's probably a better way of doing this.
  # In order NOT to reset the game on a manual page refresh, I'm checking this variable.
  # The variable is set in the findFoundationCards method

  if $firstLoad = 0
    helper_method :moveToF2
    #$cards = [1,2,3,4,5,6,7,8,9,10,11,12]
    $cards = []
    $found1 = []
    $found2 = []
    $found3 = []
    $found4 = []
    $waste1 = []
    $waste2 = []
    $waste3 = []
    $waste4 = []
    $fndSetup = []

    #card class
    class Card
      attr_accessor :id, :value, :suit
      def initialize (id, value, suit)
        @id = id
        @value = value
        @suit = suit
      end
      def to_s; id.to_s; suit.to_s; end
    end

    #build & shuffle deck
    @suits = %w{s c h d}
              # 2 3 4 5 6 7 8 9 10  J  Q  K  A
    @ranks = %w{2 3 4 5 6 7 8 9 10 11 12 13 14}
    @suits.each do |suit|
      @ranks.size.times do |i|
        id = suit + @ranks[i].to_s
        @card = Card.new(id, @ranks[i], suit)
        $cards << @card
      end
    end
    $cards.shuffle!
    $firstLoad =0
  end

  def index
      findFoundationCards
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

  def moveToF1
    moveMyCard($found1,1)
    redirect_to game_play_index_path
  end

  def moveToF2
    moveMyCard($found2,2)
    redirect_to game_play_index_path
  end

  def moveToF3
    moveMyCard($found3,3)
    redirect_to game_play_index_path
  end

  def moveToF4
    moveMyCard($found4,4)
    redirect_to game_play_index_path
  end

  def moveToW1
    $waste1 << $cards.last
    $cards.pop
    redirect_to game_play_index_path
  end

  def moveToW2
    $waste2 << $cards.last
    $cards.pop
    redirect_to game_play_index_path
  end

  def moveToW3
    $waste3 << $cards.last
    $cards.pop
    redirect_to game_play_index_path
  end

  def moveToW4
    $waste4 << $cards.last
    $cards.pop
    redirect_to game_play_index_path
  end

  private
    def findFoundationCards
      if $firstLoad == 0
        $foundem = []
        $foundemall = 0
        $cards.each { |card|
          if $foundemall == 4
            break
          end
          if card.value.to_i == 14 && $foundem[0] == nil
            $found1 << card
            $cards.delete(card)
            $foundem[0] = card
            $foundemall += 1
          end
          if card.value.to_i == 2 && $foundem[1] == nil
            $found2 << card
            $cards.delete(card)
            $foundem[1] = card
            $foundemall += 1
          end
          if card.value.to_i == 3 && $foundem[2] == nil
            $found3 << card
            $cards.delete(card)
            $foundem[2] = card
            $foundemall += 1
          end
          if card.value.to_i == 4 && $foundem[3] == nil
            $found4 << card
            $cards.delete(card)
            $foundem[3] = card
            $foundemall += 1
          end
        }
      end
      $firstLoad += 1
    end

end
