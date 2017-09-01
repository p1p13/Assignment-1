class SalesTaxCalculator

  EXEMPTED_PRODUCT_LIST = ["book", "books", "chocolate", "chocolates", "pills"]
  
  def initialize
    @net_sales_tax = 0
    @net_price = 0
    @products = []
  end

  def calculate_sales_tax(product_details)
    tax = 0
    tax = product_details[:price] * 0.1 if product_details[:is_taxable]
    tax += product_details[:price] * 0.05 if product_details[:is_imported]
    round_off(tax)
  end

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

  def get_name(product)
    product.slice(0, product.index("at ") - 1)
  end

  def get_quantity(product)
    product[0].to_i
  end

  def get_price(product)
    product[-1].to_f
  end

  def imported?(product_item)
    product_item.include?("imported")
  end

  def taxable?(product)
    (EXEMPTED_PRODUCT_LIST & product).empty?
  end

  def get_product_details(product)
      product_split = product.split(' ')
      { name: get_name(product), quantity: get_quantity(product_split), price: get_price(product_split), 
        is_imported: imported?(product_split), is_taxable: taxable?(product_split) 
      }
  end

  def add_product_details(product_list)
    product_list.each do |product|
      product_details = get_product_details(product)
      product_details[:sales_tax] = calculate_sales_tax(product_details)
      @products.push(product_details)
    end
  end

  def get_products
    @products
  end

  def get_net_tax
    @products.inject(0) { |total_value, current_product| total_value + current_product[:sales_tax] * current_product[:quantity] }
  end

  def get_net_price
    @products.inject(0) { |total_value, current_product| total_value + (current_product[:price] + current_product[:sales_tax]) * current_product[:quantity]  }
  end

  private
  def round_off(value)
    (value / 0.05).ceil * 0.05
  end
end

sales_tax_calculator = SalesTaxCalculator.new
product_list = sales_tax_calculator.take_user_input
sales_tax_calculator.add_product_details(product_list)
products = sales_tax_calculator.get_products
net_sales_tax = sales_tax_calculator.get_net_tax
net_price = sales_tax_calculator.get_net_price
products.each do |product|
  puts "#{product[:name]}: #{'%.2f' % ((product[:price] + product[:sales_tax]) * product[:quantity])}"
end
puts "Sales Taxes: #{'%.2f' %net_sales_tax}"
puts "Total: #{'%.2f' %net_price}"
