class Card
    attr_accessor :id, :value, :suit
    def initialize (id, value, suit)
      @id = id
      @value = value
      @suit = suit
    end

    def to_s; id.to_s; suit.to_s; end
end