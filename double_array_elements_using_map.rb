class List
  def double_list(input_list)
    input_list.map { |element| 2 * element}
  end

  def take_user_input
    # prompt the user for number of elements in 1st array
    puts "enter number of elements in array"
    length = gets.chomp().to_i
    # prompt the user for each element of the 1st array
    puts "enter elements in the array"
    input_list = []
    length.times do
      input_list.push(gets.chomp.to_i)
    end
    input_list
  end
  
  def print_doubled_list(input_list)
    # get a array formed by joining of the two given arrays using the 'join_lists' method defined above
    joined_list = double_list(input_list)
    puts "your new array is:"
    # print the elements of the new array
    joined_list.each do |element|
      puts element
    end
  end
end

list = List.new
input_list = list.take_user_input
list.print_doubled_list(input_list)
