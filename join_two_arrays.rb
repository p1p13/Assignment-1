class List
  # define a function to join two arrays
  def join_lists(target_list, source_list)
    # add elements of 2nd array to the new array
    source_list.each do |element|
      target_list.push(element)
    end
  end

  def take_user_input
    # prompt the user for number of elements in array
    puts "enter number of elements in array"
    num1 = gets.chomp().to_i
    # prompt the user for each element of the array
    puts "enter elements in the array"
    source_list = []
    num1.times do
      source_list.push(gets.chomp)
    end
    source_list
  end
  
  def print_joined_list(target_list, source_list)
    # get a array formed by joining of the two given arrays using the 'join_lists' method defined above
    join_lists(target_list, source_list)
    puts "your new array is:"
    # print the elements of the new array
    target_list.each do |element|
      puts element
    end
  end  
end

list = List.new
target_list = list.take_user_input
source_list = list.take_user_input
list.print_joined_list(target_list, source_list)

