class Frequency
  # method to create a hash of frequencies of characters in the array passed as arguments
  def get_frequency(input_list)
    # initialize an empty hash
    frequency_list = Hash.new(0)
    input_list.each do |element|
      # if element is not present in hash add it with frequency value of 1,otherwise increase its frequency value by 1
      frequency_list[element] += 1
    end
    return frequency_list
  end

  def take_user_input
    # prompt the user for lengthber of elements
    puts "enter lengthber of elements in array of characters"
    length = gets.chomp().to_i
    # prompt the user for each element of the array
    puts "enter elements in array of characters"
    input_list = []
    length.times do
      input_list.push( gets.chomp )
    end
    return input_list
  end
  
  def print_frequency_list(input_list)
    # get a frequency hash corresponding to the array
    frequency_list = get_frequency(input_list)
    # print element vs frequency for the given array as per the frequency hash
    frequency_list.each do |element, frequency|
      puts "#{element}: #{frequency}"
    end
  end
end

frequency = Frequency.new
input_list = frequency.take_user_input
frequency.print_frequency_list(input_list)
