require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction_amount

  def initialize(discount=0)
    self.total = 0
    self.discount = discount
    self.items = []
    self.last_transaction_amount = 0
  end
  #binding.pry

  #def total=(value)
    #@total = value
  #end

  #def discount=(value)
    #@discount = value
  #end

  #def total
    #@total
  #end

  #def discount
    #@discount
  #end

  def add_item(title, price, quantity=1)
    self.total += price * quantity
    quantity.times do
      items << title
    end
    last_transaction_amount = price * quantity
  end

  def apply_discount
    if discount != 0
      @total -= (@total * (@discount / 100.to_f))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= last_transaction_amount
  end

end
