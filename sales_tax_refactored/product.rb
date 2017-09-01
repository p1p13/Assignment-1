require_relative "calculator"

class Product

  include Calculator
  
  EXEMPTED_PRODUCT_LIST = ["book", "books", "chocolate", "chocolates", "pills"]

  attr_accessor :name, :quantity, :price, :is_imported, :is_taxable, :sales_tax, :total_price, :total_tax

  def initialize(attributes)
    attributes.each { |attribute,value| instance_variable_set("@#{attribute}",value) }
  end

  def sales_tax
    calculate_sales_tax(self.price, self.is_taxable, self.is_imported)
  end

  def total_price
    self.quantity * (self.price + self.sales_tax)
  end

  def total_tax
    self.quantity * self.sales_tax
  end

end
