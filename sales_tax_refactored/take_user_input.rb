module UserInput
  def take_user_input
    puts "enter number of inputs"
    number_of_inputs = gets.chomp.to_i
    product_list = []
    puts "enter product details for each input" 
    number_of_inputs.times do 
      product_list.push(gets.chomp)
    end
    product_list
  end
end
