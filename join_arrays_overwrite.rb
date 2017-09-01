class Array
  def join(input_list)
    input_list.each do |element|
      self.push(element)
    end
  end
end

class List
  def take_user_input
    # prompt the user for number of elements in array
    puts "enter number of elements in array"
    length = gets.chomp().to_i
    # prompt the user for each element of the array
    puts "enter elements in the array"
    source_list = []
    length.times do
      source_list.push(gets.chomp)
    end
    source_list
  end
  
  def print_joined_array(source_list, target_list)
    # get a array formed by joining of the two given arrays using the 'join_arrays' method defined above
    target_list.join(source_list)
    puts "your new array is:"
    # print the elements of the new array
    target_list.each do |element|
      puts element
    end
  end
end

list = List.new
source_list = list.take_user_input
target_list = list.take_user_input
list.print_joined_array(source_list, target_list)
