# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

suits = %w{s c h d}
ranks = %w{1 2 3 4 5 6 7 8 9 10 11 12 13}
@deck_stack = []
suits.each do |suit|
  ranks.size.times do |i|
    id = suit + ranks[i].to_s
    if(id == "s1")
      Point1Card.create(card_id: id, value: ranks[i], suit: suit)
    elsif (id=="s2")
      Point2Card.create(card_id: id, value: ranks[i], suit: suit)
    elsif (id=="s3")
      Point3Card.create(card_id: id, value: ranks[i], suit: suit)
    elsif (id=="s4")
      Point4Card.create(card_id: id, value: ranks[i], suit: suit)
    else
      @deck_stack << [id, ranks[i],suit]
    end
  end
end
@deck_stack.shuffle!
@deck_stack.size.times do |i|
  DeckCard.create(card_id: @deck_stack[i][0], value: @deck_stack[i][1], suit: @deck_stack[i][2])
end

