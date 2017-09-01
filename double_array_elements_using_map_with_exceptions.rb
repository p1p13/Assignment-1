class List
  def double_list(input_list)
    input_list.map do |element|
      if (element.is_a? Integer) || (element.is_a? Float)
        element * 2
      else
        element
      end
    end
  end

  def take_user_input
    # prompt the user for number of elements in 1st array
    puts "enter number of elements in array"
    num1 = gets.chomp().to_i
    # prompt the user for each element of the 1st array
    puts "enter elements in the array"
    input_list = []
    num1.times do
      input_char = (gets.chomp)
      if input_char.to_i != 0
        if input_char.to_f - input_char.to_i !=0
          input_char = input_char.to_f
        else
          input_char = input_char.to_i
        end
      end
      input_list.push(input_char)
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

