# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

suits = %w{s c h d}
ranks = %w{1 2 3 4 5 6 7 8 9 10 11 12 13}

suits.each do |suit|
  ranks.size.times do |i|
    id = suit + ranks[i].to_s
    Card.create(card_id: id, value: ranks[i], suit: suit)
  end
end