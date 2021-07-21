require "./card.rb"
require "byebug"

class Board

    def self.print_grid(arr)
        arr.each do |row|
          puts row.join(" ")
        end
    end

    attr_reader :size, :board

    def initialize(size) # 2
        @size = size 
        @board = Array.new(@size) { Array.new(@size) }  
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end

    def make_cards
        num = @size
        all_cards = []
        card_arr = []
        num.times { card_arr << Card.new }
        card_arr.each {|card| all_cards << Card.new(card.card)}
        all_cards += card_arr
    end

    def populate
        complete_arr = make_cards
        shuffled_arr = complete_arr.shuffle! # 4

        @board.map! do |row|
            row.map! do |pos|
                shuffled_arr.pop
            end
        end
    end

    def render # print out the board in current state
        @board.map do |row|
            row.map do |ele|
                if !ele.card_up
                    " "
                else
                    ele.card
                end
            end
        end
    end

    # def reveal(guessed_pos) # reveal the card a position
    #     # If card instance == face down then do nothing
    #     # If face up, get value of the card at guessed pos
    #     if !@board[guessed_pos].card_up
    #         code here
    #     end

    # end

    def print
        Board.print_grid(self.render)
    end

end

b = Board.new(2)
b.print

# [
#     [ , , G],
#     [ , , ],
#     [ ,G, ]
# ]

# Print creates completely new instances
# Mmake_card creates duplicate instances of card