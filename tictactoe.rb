# Requirements:

# 1. draw a gameboard
# 2. player assign to "X"
# 3. computer assign to "O"

# loop until a winner appears or all positions are taken.
#   player picks a position
#   check the winner
#   computer picks a position which are still empty
#   check the winner

# if winner appears, show the winner
# else it's a tie.
require "pry"

def initializing_the_game_board_positions()
  board = {}
  # postions = {1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}
  # same effect as above code
  (1..9).each {|position| board[position] = " "}
  board # returns a game board
end

def availiable_positions(board) 
  board.select {|key, value| value == " "}.keys
end


def player_picks_position(board)
  puts "Please pick a position (1-9)!"
  player_pick = gets.chomp.to_i
  board[player_pick] = "X"
end

def computer_picks_position(board)
  computer_pick = availiable_positions(board).sample
  board[computer_pick] = "O"
end

def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_lines.each do |line|
      if board[line[0]] == 'X' and board[line[1]] == 'X' and board[line[2]] == 'X'
        return 'Player'
      elsif board[line[0]] == 'O' and board[line[1]] == 'O' and board[line[2]] == 'O'
        return 'Computer'
      else
        return nil
      end
    end
end

def draw_game_board(board)
  puts " #{board[1]}| #{board[2]}| #{board[3]}   "
  puts "-------------"
  puts " #{board[4]}| #{board[5]}| #{board[6]}   "
  puts "-------------"
  puts " #{board[7]}| #{board[8]}| #{board[9]}   "
end

board = initializing_the_game_board_positions
draw_game_board(board)

begin
  player_picks_position(board)
  computer_picks_position(board)
  draw_game_board(board)
  winner = check_winner(board)
end until winner || availiable_positions(board).empty?

if winner 
  puts " #{winner} won!"
else
  puts "It's a tie"
end