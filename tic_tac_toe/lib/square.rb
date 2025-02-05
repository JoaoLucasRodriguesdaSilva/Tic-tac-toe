# frozen_string_literal: true

# Minor component of tic tac toe
class Square
  attr_reader :square_symbol

  def initialize
    @square_symbol = nil
  end

  def place_symbol(symbol)
    @square_symbol = symbol
  end

  def nil?
    @square_symbol.nil?
  end

  def to_s
    @square_symbol.nil? ? ' ' : @square_symbol
  end

  private

  attr_writer :square_symbol
end
