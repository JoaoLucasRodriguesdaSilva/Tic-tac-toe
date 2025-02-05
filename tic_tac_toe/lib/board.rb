# frozen_string_literal: true

require_relative 'square'

# Tic tac toe's board
class Board
  attr_reader :board

  def initialize
    @board = []
    (0..2).each do |_|
      colunm = []
      (0..2).each do |_|
        colunm.push(Square.new)
      end
      @board.push(colunm)
    end
  end

  def place_symbol(row, colunm, symbol)
    @board[row][colunm].place_symbol(symbol)
  end

  def to_s
    @board.each { |row| puts row.join('|') }
  end

  private

  attr_writer :board
end
