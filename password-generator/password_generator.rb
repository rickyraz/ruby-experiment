# frozen_string_literal: true
require_relative 'lib/auth'

puts password_hash = Auth.hash_password('Akukamukita83')
puts Auth.verify_password('Akukamukita83', password_hash)
