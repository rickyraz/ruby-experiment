# frozen_string_literal: true

# Numbers
p 123.class           # => Integer
p 123.45.class        # => Float
p (1/3r).class        # => Rational
p (1 + 2i).class      # => Complex

# Text & Symbols
p 'hello'.class       # => String
p :symbol.class       # => Symbol

# Boolean & Nil
p true.class          # => TrueClass
p false.class         # => FalseClass
p nil.class           # => NilClass

p [1, 2, 3].class # => Array
{ a: 1 }.class # => Hash
p (1..10).class # => Range

p(/regex/.class) # => Regexp
p Time.now.class # => Time
p File.open(__FILE__).class # => File (__FILE__ = file sekarang)
p proc {}.class # => Proc
p -> {}.class # => Proc (tapi lambda)

class User; end
p User.class          # => Class
p Module.new.class    # => Class (Module adalah Class)
