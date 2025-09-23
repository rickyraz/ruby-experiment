# frozen_string_literal: true

arr = []

arr << 'Value'
arr << 4

p arr

p 'TSET'.is_a?(Object)
p nil.is_a?(Object) # => false (nil special case)
p nil.class

puts RUBY_VERSION

p nil.class.ancestors
