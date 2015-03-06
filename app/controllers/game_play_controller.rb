class GamePlayController < ApplicationController

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

  @API_URL = 'http://localhost:3000/api/deck_cards'
  @response = HTTParty.get(@API_URL)
  @hash = JSON.parse(@response.body)

  @hash.size.times do |i|
    @card = Card.new(@hash[i]["card_id"], @hash[i]["value"], @hash[i]["suit"])
    $cards << @card
  end


  def index

  end

  def moveToF1
    if ($cards.last.value.to_i).modulo(1) == 0
      $found1 << $cards.last
      $cards.pop
    end
    redirect_to game_play_index_path
  end

  def moveToF2
    if ($cards.last.value.to_i).modulo(2) == 0
      $found2 << $cards.last
      $cards.pop
    end
    redirect_to game_play_index_path
  end

  def moveToF3
    if ($cards.last.value.to_i).modulo(3) == 0
      $found3 << $cards.last
      $cards.pop
    end
    redirect_to game_play_index_path
  end

  def moveToF4
    if ($cards.last.value.to_i).modulo(4) == 0
      $found4 << $cards.last
      $cards.pop
    end
    redirect_to game_play_index_path
  end

end
