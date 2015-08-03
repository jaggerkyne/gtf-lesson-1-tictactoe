# Problem: create a Tic Tac Toe Game that the user can play against computer.

# Steps to solve the Problem:

# 1. Need a game board that has 9 squares: "3 X 3". (draw the board and keep track on the board)
# 2. Assign player with "X" and Assign computer to "O" (This is an assumption at this stage)

# loop until a winner appears or all 9 squares are taken
#   3. Player go first, computer goes second (This is an assumption at this stage)
#       (player or computer can only take position on the unoccupied positions) 
#   4. check winner
# 5. when winner appears, print the winner
# 6. ask if want to play the game again (y/n)

require "pry"

# an empty hash to handle the gameboard
board = {}

def init_positions(board)
  # assign positions on the gameboard
  (1..9).each {|postion| board[postion] = " "}
  board
end

def draw_board(board)
  puts "#{board[1]}|#{board[2]}|#{board[3]}"
  puts "-----"
  puts "#{board[4]}|#{board[5]}|#{board[6]}"
  puts "-----"
  puts "#{board[7]}|#{board[8]}|#{board[9]}"
end

def availiable_postions(board)
  board.select {|key, value| value == " "}.keys
end

def player_picks(board)
  # first, check availiable positions to pick
  empty_positions = availiable_postions(board)
  # then show the position numbers
  puts "Please pick a position on the board #{empty_positions}" # need to hanle if player enter taken position
  player_position = gets.chomp.to_i
  board[player_position] = "X"
end

# stuck how to compare player and computer positions against the winning positions.
def check_winner(board)
  winning_positions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  
  player_positions = board.select {|key, value| value == "X"}.keys
  computer_positions = board.select {|key, value| value == "O"}.keys
  
winning_positions.each do |positions|
    case positions
    when player_positions == positions
      puts "Player won"  
    when computer_positions == positions
      puts "Computer won"
    end
  end
end

def computer_picks(board)
  empty_positions = availiable_postions(board)
  computer_position = empty_positions.sample
  board[computer_position] = "O"
end

init_positions(board)
draw_board(board)
puts "Welcome to TTT game!"
begin
  player_picks(board)
  computer_picks(board)
  check_winner(board)
  draw_board(board)
end until availiable_postions(board).empty?

