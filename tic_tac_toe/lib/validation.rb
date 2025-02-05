# frozen_string_literal: true

# Fuctions to check victory or errors
class Validation
  def initialize(board)
    @board = board
  end

  def victory?(symbol)
    if win_by_row?(symbol) || win_by_colunm?(symbol) || win_by_diagonal?(symbol)
      puts "#{symbol} wins"
      true
    else
      false
    end
  end

  def tie?
    @board.board.flatten.all? { |square| square.to_s != ' ' }
  end

  def valid_position?(row, column)
    if row.negative? || row > 2 || column.negative? || column > 2
      puts 'Position invalid'
      puts @board
      false
    else
      true
    end
  end

  def square_free?(row, column)
    if @board.board[row][column].nil?
      true
    else
      puts 'Position ocupied'
      false
    end
  end

  private

  attr_accessor :board

  def win_by_row?(check_symbol)
    @board.board.any? do |row|
      row.all? { |col| col.to_s == check_symbol }
    end
  end

  def win_by_colunm?(check_symbol)
    (0..2).any? do |col|
      @board.board.all? { |row| row[col].to_s == check_symbol }
    end
  end

  def win_by_diagonal?(check_symbol)
    main_diagonal_check?(check_symbol) || sec_diagonal_check?(check_symbol)
  end

  def main_diagonal_check?(symbol)
    @board.board.each_with_index.all? { |row, i| row[i].to_s == symbol }
  end

  def sec_diagonal_check?(symbol)
    @board.board.each_with_index.all? { |row, i| row[2 - i].to_s == symbol }
  end
end
