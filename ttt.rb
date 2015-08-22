# This is my tird run of ttt game.
# 1. Come up with Specifications, which will determine the project scope.
# 2. Application logic to fulfill the requirements, sequence of steps.
# 3. Translate those steps into code.
# 4. Run code to verfify logic.

# Tic Tac Toe Game:

# 1. draw a game board (2. keep track on the positions)
# loop
# 3. player pick a square "X"
# 4. computer pick an empty square "O"
# 5. check for winner
# until winner appers or all squares are taken

# 6. if there's a winner, 
  # display winner 
  # or else it's a tie.

# require 'pry'

def initialize_board
  b = {}
  (1..9).each {|position| b[position] = " "}
  b 
end

def draw_board(b)
  system 'clear'
  puts "#{b[1]}|#{b[2]}|#{b[3]}"
  puts "-+-+-"
  puts "#{b[4]}|#{b[5]}|#{b[6]}"
  puts "-+-+-"
  puts "#{b[7]}|#{b[8]}|#{b[9]}"
end

def player_pick_square(b)
  begin
    puts "Pick a square: (1 - 9)"
    position = gets.chomp.to_i
  end until empty_positions(b).include?(position)
    b[position] = "X"
end

def empty_positions(b)
  b.select {|k,v| v == " "}.keys
end

def computer_picks_square(b)
  computer_postion = empty_positions(b).sample
  b[computer_postion] = "O"
end

def all_squares_taken?(b)
  empty_positions(b) == []
end

def check_winner(b)
  winning_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,3],[1,5,9],[3,5,7]] 
  winning_lines.each do |line|
  return "Player" if b.values_at(*line).count("X") == 3
  return "Computer" if b.values_at(*line).count("O") == 3
end
  nil
end

board = initialize_board
draw_board(board)
begin
  player_pick_square(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || all_squares_taken?(board)

if winner
  puts "The winner is #{winner}!"
else
  puts "It's a tie."
