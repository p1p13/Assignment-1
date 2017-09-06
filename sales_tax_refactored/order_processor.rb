require_relative "product"

class OrderProcessor

  def initialize
    @net_sales_tax = 0
    @net_price = 0
    @products = []
  end

  def get_product_details(order_list)
    order_list.each do |current_product|
      product_split = current_product.split(" ")
      product = Product.new(name: name(current_product), price: price(product_split), 
        quantity: quantity(product_split), is_imported: is_imported?(product_split), is_taxable: is_taxable?(product_split))
      product.sales_tax = product.sales_tax
      product.total_price =  product.total_price
      product.total_tax = product.total_tax
      @products.push(product)
    end
  end

  def name(product)
    at_index = product.index("at ")
    product.slice(0, at_index - 1)
  end

  def price(product)
    product[-1].to_f
  end

  def quantity(product)
    product[0].to_i
  end

  def is_imported?(product)
    product.include?("imported")
  end

  def is_taxable?(product)
    (Product::EXEMPTED_PRODUCT_LIST & product).empty?
  end

  
  
  def get_net_tax
    @products.inject(0) { |total_value, current_product| total_value + current_product.total_tax }
  end

  def get_net_price
    @products.inject(0) { |total_value, current_product| total_value + current_product.total_price }
  end

  def print_order
    @products.each do |product|
      puts "#{product.name}: #{'%.2f' % (product.total_price) }"
    end
  end
end



