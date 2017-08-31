require_relative "product"
require_relative "calculator"
require_relative "take_user_input"

class OrderProcessor

  EXEMPTED_PRODUCT_LIST = ["book", "books", "chocolate", "chocolates", "pills"]

  include Calculator, UserInput

  def initialize
    @net_sales_tax = 0
    @net_price = 0
    @products = []
  end

  def get_product_details(product_list)
    product_list.each do |current_product|
      product_split = current_product.split(" ")
      product = Product.new
      product.price = product_split[-1].to_f
      product.name = current_product.slice(0, current_product.index("at ") - 1)
      product.quantity = product_split[0].to_i
      product.is_imported = product_split.include?("imported")
      product.is_taxable = (EXEMPTED_PRODUCT_LIST & product_split).empty?
      @products.push(product)
    end
  end

  def assign_sales_tax
    @products.each do |product|
      product.sales_tax = calculate_sales_tax(product.price, product.is_taxable, product.is_imported)
    end
  end

  def get_products
    @products
  end

  def get_net_tax
    @products.inject(0) { |total_value, current_product| total_value + current_product.sales_tax * current_product.quantity }
  end

  def get_net_price
    @products.inject(0) { |total_value, current_product| total_value + (current_product.price + current_product.sales_tax) * current_product.quantity }
  end
end

order_processor = OrderProcessor.new
product_list = order_processor.take_user_input
order_processor.get_product_details(product_list)
order_processor.assign_sales_tax
net_sales_tax = order_processor.get_net_tax
net_price = order_processor.get_net_price
products = order_processor.get_products
products.each do |product|
  puts "#{product.name}: #{'%.2f' % ((product.price + product.sales_tax) * product.quantity)}"
end
puts "Sales Taxes: #{'%.2f' %net_sales_tax}"
puts "Total: #{'%.2f' %net_price}"


