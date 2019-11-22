require 'pry'

class CashRegister

  attr_accessor :total, :transactions, :items, :discount, :quantity, :price, :applied
  attr_reader :title

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(title, price, quantity=1)
   
    @total += price * quantity
    # @price = @total += (price * quantity) 
    quantity.times do
    @items << title
    @transactions << price
    end

  end


  def apply_discount
    
      # @total = @total - (@discount *10)
      if @discount > 0
      @total = @total * (100 - @discount) / 100
      
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
    # @applied = self.total - @discount 
    # @total * ((100 - @discount) / 100) 
    # @discount = 20 #convert to %
    # (@discount *10)
    # binding.pry
  end


def items
 @items
#  binding.pry
end

def void_last_transaction
  
 self.total = @total - @transactions.pop
 #binding.pry

 if @items.length == 0
  self.total = @total - @total
  
 end
end

end
