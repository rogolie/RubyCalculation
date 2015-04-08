require_relative('../app/models/card.rb')
class APILogic
  @API_URL = 'http://localhost:3000/api/'
  
  #Deletes Data and Restarts Game
  def self.newGame()
    HTTParty.delete("#@API_URL/deck_cards")
    HTTParty.delete("#@API_URL/point1_cards")
    HTTParty.delete("#@API_URL/point2_cards")
    HTTParty.delete("#@API_URL/point3_cards")
    HTTParty.delete("#@API_URL/point4_cards")
    HTTParty.delete("#@API_URL/waste1_cards")
    HTTParty.delete("#@API_URL/waste2_cards")
    HTTParty.delete("#@API_URL/waste3_cards")
    HTTParty.delete("#@API_URL/waste4_cards")

    suits = %w{s c h d}
    ranks = %w{1 2 3 4 5 6 7 8 9 10 11 12 13}
    @deck_stack = []
    suits.each do |suit|
      ranks.size.times do |i|
        id = suit + ranks[i].to_s
        if(id == "s1")
          HTTParty.post("#@API_URL/point1_cards",
                        :body => { :card_id => id,
                                   :value => ranks[i],
                                   :suit => suit
                        }.to_json,
                        :headers => { 'Content-Type' => 'application/json' })
        elsif (id=="s2")
          HTTParty.post("#@API_URL/point2_cards",
                        :body => { :card_id => id,
                                   :value => ranks[i],
                                   :suit => suit
                        }.to_json,
                        :headers => { 'Content-Type' => 'application/json' })
        elsif (id=="s3")
          HTTParty.post("#@API_URL/point3_cards",
                        :body => { :card_id => id,
                                   :value => ranks[i],
                                   :suit => suit
                        }.to_json,
                        :headers => { 'Content-Type' => 'application/json' })
        elsif (id=="s4")
          HTTParty.post("#@API_URL/point4_cards",
                        :body => { :card_id => id,
                                   :value => ranks[i],
                                   :suit => suit
                        }.to_json,
                        :headers => { 'Content-Type' => 'application/json' })
        else
          @deck_stack << [id, ranks[i],suit]
        end
      end
    end
    @deck_stack.shuffle!
    @deck_stack.size.times do |i|
      HTTParty.post("#@API_URL/deck_cards",
                    :body => { :card_id => @deck_stack[i][0],
                               :value => @deck_stack[i][1],
                               :suit => @deck_stack[i][2]
                    }.to_json,
                    :headers => { 'Content-Type' => 'application/json' })
    end
  end

  #Retrieves Top Card of a pile
  #Returns Card topCard
  def self.getTopCard(pile)

    @response = HTTParty.get("#@API_URL/#{pile}_cards/top")

      @hash = JSON.parse(@response.body)
     topCard = Card.new(@hash["card_id"], @hash["value"], @hash["suit"])
  
  end
  
  #Retrieves All Cards of a pile
  #Returns Card[] cards
  def self.getAllCards(pile)
    cards = Array.new
    
    @response = HTTParty.get("#@API_URL/#{pile}_cards")
    @hash = JSON.parse(@response.body)
    
    @hash.size.times do |i|
    @card = Card.new(@hash[i]["card_id"], @hash[i]["value"], @hash[i]["suit"])
    cards << @card
    end
    cards
  end
  
  def self.moveTopCard(pile1, pile2)

    ##First Retrieve Card from pile1
    @response = HTTParty.get("#@API_URL/#{pile1}_cards/top")
    @hash = JSON.parse(@response.body)
    topCard = Card.new(@hash["card_id"], @hash["value"], @hash["suit"])
    
    ##Delete Card from pile1
    HTTParty.delete("#@API_URL/#{pile1}_cards/#{topCard.id}")
    
    ##Post Card into pile2
    HTTParty.post("#@API_URL/#{pile2}_cards",
    :body => { :card_id => topCard.id,
               :value => topCard.value,
               :suit => topCard.suit
             }.to_json,
    :headers => { 'Content-Type' => 'application/json' })
  end
end