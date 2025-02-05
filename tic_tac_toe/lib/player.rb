# frozen_string_literal: true

require_relative 'board'
require_relative 'validation'

# Player class
class Player
  attr_accessor :symbol, :validator

  def initialize(symbol, validator)
    @symbol = symbol
    @validator = validator
  end

  def play(board)
    row = -1
    column = -1
    loop do
      puts 'insira linha:'
      row = gets.to_i
      puts 'insira coluna:'
      column = gets.to_i
      break if @validator.valid_position?(row, column) && @validator.square_free?(row, column)
    end

    board.place_symbol(row, column, @symbol)
  end
end
