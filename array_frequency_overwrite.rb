class Array
  def get_frequency
    # initialize an empty hash
    frequency_list = Hash.new(0)
    self.each do |element|
      # if element is not present in hash add it with frequency value of 1,otherwise increase its frequency value by 1
      frequency_list[element] += 1
    end
    frequency_list
  end
end

class Frequency
  def take_user_input
    # prompt the user for lengthber of elements
    puts "enter number of elements in list of characters"
    length = gets.chomp().to_i
    # prompt the user for each element of the list
    puts "enter elements in list of characters"
    input_list = []
    length.times do
      input_list.push( gets.chomp )
    end
    return input_list
  end
  
  def print_frequency_list(input_list)
    # get a frequency hash corresponding to the list
    frequency_list = input_list.get_frequency
    # print element vs frequency for the given list as per the frequency hash
    frequency_list.each do |element, frequency|
      puts "#{element}: #{frequency}"
    end
  end
end

frequency = Frequency.new
input_list = frequency.take_user_input
frequency.print_frequency_list(input_list)
