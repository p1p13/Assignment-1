class List
  def join_lists_inbuilt(target_list, source_list)
    target_list.concat(source_list)
  end

  def take_user_input
    # prompt the user for number of elements in 1st array
    puts "enter number of elements in array"
    num1 = gets.chomp().to_i
    # prompt the user for each element of the 1st array
    puts "enter elements in the array"
    input_list = []
    num1.times do
      input_list.push(gets.chomp)
    end
    input_list
  end
  
  def print_joined_list_inbuilt(target_list, source_list)
    # get a array formed by joining of the two given arrays using the 'join_lists' method defined above
    joined_list = join_lists_inbuilt(target_list, source_list)
    puts "your new array is:"
    # print the elements of the new array
    joined_list.each do |element|
      puts element
    end
  end
end

list = List.new
target_list = list.take_user_input
source_list = list.take_user_input
list.print_joined_list_inbuilt(target_list, source_list)
