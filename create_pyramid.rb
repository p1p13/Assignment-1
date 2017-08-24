puts "enter height"
height = gets.chomp.to_i
height = height * 2 - 1
(1..height).step(2) do |row|
  blank_space = (height - row) / 2
  height.times do |column|
    print ( column + 1 <= blank_space || ( height - column ) <= blank_space) ? ' ' : '*'
  end
  puts
end
