# frozen_string_literal: true

class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @current_player = 'X'
  end

  def display_board
    puts "\n  0   1   2"
    @board.each_with_index do |row, index|
      puts "#{index} #{row[0]} | #{row[1]} | #{row[2]}"
      puts '  --|---|--' unless index == 2
    end
    puts
  end

  def make_move(row, col)
    return false if invalid_move?(row, col)

    @board[row][col] = @current_player
    true
  end

  def invalid_move?(row, col)
    row.negative? || row > 2 || col.negative? || col > 2 || @board[row][col] != ' '
  end

  def check_winner
    # Check rows
    @board.each do |row|
      return @current_player if row.all? { |cell| cell == @current_player }
    end

    # Check columns
    3.times do |col|
      return @current_player if @board.all? { |row| row[col] == @current_player }
    end

    # Check diagonals
    return @current_player if diagonal_win?

    nil
  end

  def diagonal_win?
    # Top-left to bottom-right
    return true if (0..2).all? { |i| @board[i][i] == @current_player }

    # Top-right to bottom-left
    (0..2).all? { |i| @board[i][2 - i] == @current_player }
  end

  def board_full?
    @board.flatten.none? { |cell| cell == ' ' }
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def play
    puts '=== TIC TAC TOE ==='
    puts 'Player X goes first!'

    loop do
      display_board
      puts "Player #{@current_player}, enter your move (row col): "

      input = gets.chomp.split.map(&:to_i)
      row = input[0]
      col = input[1]

      unless make_move(row, col)
        puts 'Invalid move! Try again.'
        next
      end

      if check_winner
        display_board
        puts "🎉 Player #{@current_player} wins!"
        break
      elsif board_full?
        display_board
        puts "It's a tie! 🤝"
        break
      end

      switch_player
    end
  end
end
