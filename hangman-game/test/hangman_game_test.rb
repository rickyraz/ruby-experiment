# frozen_string_literal: true

require_relative '../lib/hangman_game'

RSpec.describe HangmanGame do
  let(:game) { described_class.new }

  before do
    # Force secret_word jadi "ruby" supaya konsisten
    game.instance_variable_set(:@secret_word, 'ruby')
  end

  describe '#display_word' do
    it 'menampilkan underscores untuk semua huruf yang belum ditebak' do
      expect(game.display_word).to eq('_ _ _ _')
    end

    it 'menampilkan huruf yang sudah ditebak' do
      game.guess_letter('r')
      expect(game.display_word).to eq('r _ _ _')
    end
  end

  describe '#guess_letter' do
    it 'mengembalikan true jika huruf ada di secret_word' do
      expect(game.guess_letter('r')).to eq(true)
    end

    it 'mengembalikan false jika huruf tidak ada di secret_word' do
      expect(game.guess_letter('z')).to eq(false)
    end

    it 'tidak menambah huruf yang sudah ditebak dua kali' do
      game.guess_letter('r')
      expect(game.guess_letter('r')).to eq(false)
    end
  end

  describe '#won?' do
    it 'true kalau semua huruf ditebak' do
      %w[r u b y].each { |letter| game.guess_letter(letter) }
      expect(game.won?).to be true
    end

    it 'false kalau masih ada huruf yang belum ditebak' do
      game.guess_letter('r')
      expect(game.won?).to be false
    end
  end

  describe '#lost?' do
    it 'true kalau wrong_attempts >= max_attempts' do
      %w[z x q w t p].each { |letter| game.guess_letter(letter) }
      expect(game.lost?).to be true
    end
  end

  describe '#game_over?' do
    it 'true kalau sudah kalah' do
      %w[z x q w t p].each { |letter| game.guess_letter(letter) }
      expect(game.game_over?).to be true
    end
  end
end
