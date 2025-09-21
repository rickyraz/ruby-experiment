# frozen_string_literal: true

require_relative 'hangman/version'

# Classic word guessing game implementation
# Players guess letters to reveal a hidden word before running out of attempts
class HangmanGame
  def initialize
    @words = %w[ruby programming computer keyboard monitor]
    @secret_word = @words.sample
    # Array untuk store huruf yang sudah ditebak
    @guessed_letters = []
    # Variables untuk tracking
    @max_attempts = 6
    @wrong_attempts = 0
  end

  def display_word
    result = []

    @secret_word.each_char do |letter|
      result << if @guessed_letters.include?(letter)
                  letter
                else
                  '_'
                end
    end

    result.join(' ')
  end

  def guess_letter(letter) # rubocop:disable Metrics/MethodLength
    letter = letter.downcase

    # Conditional: cek apakah sudah pernah ditebak
    if @guessed_letters.include?(letter)
      puts "Sudah pernah ditebak huruf '#{letter}'"
      return false
    end

    # Tambah ke array guessed_letters
    @guessed_letters << letter

    # Conditional: cek apakah huruf ada di secret_word
    if @secret_word.include?(letter)
      puts "Benar! Huruf '#{letter}' ada"
      true
    else
      @wrong_attempts += 1
      puts "Salah! Huruf '#{letter}' tidak ada"
      false
    end
  end

  def won?
    # Loop check: apakah semua huruf sudah ditebak?
    @secret_word.each_char do |letter|
      # "Return false if the condition is NOT true
      # The unless keyword is Ruby's opposite of if. It executes when the condition is false.
      return false unless @guessed_letters.include?(letter)
    end
    true
  end

  def lost?
    @wrong_attempts >= @max_attempts
  end

  def game_over?
    won? || lost?
  end

  def display_guessed_letters
    if @guessed_letters.empty
      puts 'Belum ada huruf yang ditebak'
    else
      puts "Huruf yang sudah ditebak: #{@guessed_letters.join(', ')}"
    end
  end

  def display_hangman
    puts "Kesalahan: #{@wrong_attempts}/#{@max_attempts}"
  end

  def start # rubocop:disable Metrics/AbcSize
    puts '=== HANGMAN GAME ==='
    puts "Tebak kata: #{display_word}"

    # Main game loop - while loop dengan conditional
    until game_over?
      puts "\n#{'=' * 30}"
      puts "Kata: #{display_word}"
      display_guessed_letters
      display_hangman

      print 'Masukkan huruf: '
      input = gets.chomp

      # Conditional untuk validasi input
      if input.length != 1
        puts 'Masukkan hanya 1 huruf!'
        next
      end

      guess_letter(input)
    end

    # Game over - conditional untuk hasil akhir
    puts "\n#{'=' * 30}"
    if won?
      puts '🎉 SELAMAT! Kamu menang!'
      puts "Kata: #{@secret_word}"
    else
      puts '😞 Game Over!'
      puts "Kata yang benar: #{@secret_word}"
    end
  end
end
