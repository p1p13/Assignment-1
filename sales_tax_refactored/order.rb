require_relative "order_processor"

class Order
  
  def initialize
    @items = []
  end

  def get_order
    puts "enter number of items"
    number_of_inputs = gets.chomp.to_i
    puts "enter product details for each item" 
    number_of_inputs.times do 
      @items.push(gets.chomp)
    end
    @items
  end
  
end

order = Order.new
order_list = order.get_order
order_processor = OrderProcessor.new
order_processor.get_product_details(order_list)
net_sales_tax = order_processor.get_net_tax
net_price = order_processor.get_net_price
order_processor.print_order
puts "Sales Taxes: #{'%.2f' %net_sales_tax}"
puts "Total: #{'%.2f' %net_price}"

