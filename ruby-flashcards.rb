require 'csv'
CSV.read("ruby_flash_cards.csv")

class Deck
  attr_reader :cards

  def initialize(file)
    @cards = []
    parse(file)
  end

  def parse(filename)
    CSV.foreach(filename, headers: true) do |line|
      card = Card.new(line)
      cards << card
    end
  end

end

class Card
  attr_reader :front, :back

  def initialize(args = {})
    @front = args["front"]
    @back = args["back"]
  end

end


# deck = Deck.new("ruby_flash_cards.csv")
# puts
# puts
# print deck.cards


puts
puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"
puts
deck = Deck.new("ruby_flash_cards.csv")

question_counter = 0
incorrect_questions = {}
while question_counter < deck.cards.size
  puts "TRUE or FALSE?"
  puts deck.cards[question_counter].front
  puts
  puts "ANSWER:"
  answer = gets.chomp
  puts
  if answer[0].upcase == deck.cards[question_counter].back[0]
    puts "Correct! Way to go!"
  else
    incorrect_questions[deck.cards[question_counter].front] = deck.cards[question_counter].back
    puts "Incorrect!"
    puts
    puts "The correct answer was:"
    puts deck.cards[question_counter].back
    # puts "Incorrect! Try again. You have 2 more guesses."
    # guess_counter = 0
    # while guess_counter < 2
    #   puts "ANSWER:"
    #   puts
    #   answer = gets.chomp
    #   if answer[0].upcase == deck.cards[question_counter].back[0]
    #     puts "You got it!"
    #     guess_counter += 2
    #   else
    #     guess_counter += 1
    #     puts "Incorrect!"
    #   end
    # end
  end
  question_counter += 1
  puts
end

puts "Here are the questions you got wrong and their answers. Make sure to study up!"

incorrect_questions.each do |k, v|
  puts k + ":"
  puts v
  puts
end

puts "Thanks for playing!"


