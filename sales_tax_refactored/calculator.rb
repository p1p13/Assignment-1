module Calculator
  def calculate_sales_tax(price, is_taxable, is_imported)
    tax_rate = 0
    tax_rate += 0.1 if is_taxable
    tax_rate += 0.05 if is_imported
    tax = price * tax_rate
    round_off(tax)
  end

  private
  def round_off(value)
    (value / 0.05).ceil * 0.05
  end
end
