require 'csv'
CSV.read(file)

class Deck
  attr_reader :cards

  def initialize(file)
    @cards = []
    parse(file)
  end

  def parse(filename)
    CSV.foreach(filename, headers: true) do |line|
      card = Card.new(line)
      @cards << card
  end

end

class Card
  attr_reader :front, :back

  def initialize(args = {})
    @front = args[:front]
    @back = args[:back]
  end

end
