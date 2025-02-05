# frozen_string_literal: true

require_relative 'lib/game'

puts 'Insert first player symbol'
player1 = gets.chomp
puts 'Insert second player symbol'
player2 = gets.chomp

game = Game.new(player1, player2)
game.play
