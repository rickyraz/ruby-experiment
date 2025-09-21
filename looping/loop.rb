# for
for i in 1..5
  puts i
end

# atau dengan array
words = ['ruby', 'python', 'javascript']
for word in words
  puts word
end

# times
5.times do |i|
  puts "Iterasi ke-#{i}"
end

# Option 1: Manual adjust (mulai dari angka 1) - sampai 100 5 kedepan = dari 100,101,102,103,104 artinya 5x
5.times do |i|
  puts "Iterasi ke-#{i + 100}"  # 1,2,3,4,5
end

# Option 2: Use range (mulai dari angka 1) - sampai 205 = dari 200..205 artinya 6x
(200..205).each do |i|
  puts "Iterasi ke-#{i}"      # 1,2,3,4,5
end

# .times = jumlah eksekusi
# range = dari angka A sampai angka B (inclusive)

(300...305).each do |i| # sebelum sampai 305 yaitu 304 - # 3 titik = exclude 305 = 5x
  puts "Iterasi ke-#{i}"      # 1,2,3,4,5
end

# each
[1, 2, 3, 4, 5].each do |num|
  puts num
end

# atau
%w[ruby python javascript].each do |language|
  puts language
end

# upto - downto
# dari 1 sampai 5
1.upto(5) { |i| puts i }

# dari 5 turun ke 1  
5.downto(1) { |i| puts i }


# loop break
# Contoh 2: loop dengan input user
loop do
  print "Ketik 'quit' untuk keluar: "
  input = gets.chomp
  break if input == 'quit'
  puts "Kamu ketik: #{input}"
end