require_relative('../app/models/card.rb')
class APILogic
  @API_URL = 'http://localhost:3000/api/'
  
      
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