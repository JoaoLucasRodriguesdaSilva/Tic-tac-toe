# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'validation'

# Game controller
class Game
  def initialize(symbol1, symbol2)
    @board = Board.new
    @validator = Validation.new(@board)
    @player1 = Player.new(symbol1, @validator)
    @player2 = Player.new(symbol2, @validator)
    @turn = 0
  end

  def play
    turn = 0
    until @validator.tie?
      turn += 1
      turn_p = turn.odd? ? @player1 : @player2
      turn_p.play(@board)
      puts @board
      break if @validator.victory?(turn_p.symbol)
    end
  end

  private

  attr_accessor :board, :player1, :player2, :validator, :turn
end
