module Calculator
  def calculate_sales_tax(price, is_taxable, is_imported)
    tax = 0
    tax = price * 0.1 if is_taxable
    tax += price * 0.05 if is_imported
    round_off(tax)
  end

  private
  def round_off(value)
    (value / 0.05).ceil * 0.05
  end
end