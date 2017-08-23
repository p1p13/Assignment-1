puts "enter height"
height=gets.chomp.to_i
height=height*2 - 1
(1..height).step(2) do |row|
  blank=(height-row)/2
  1.upto(height) do |col|
    print  (col<=blank || (height-col+1)<=blank) ? ' ' : '*'
  end
  print "\n"
end