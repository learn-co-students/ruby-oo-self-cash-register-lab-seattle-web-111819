require 'pry'
class CashRegister

    attr_accessor :discount, :total, :item, :price, :title, :discount
   
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @item = []
        @transactions = []
    end

    def total
        #binding.pry
        @total
    end

    def add_item(title, price, quantity=1)
        @last_transaction = quantity * price
        @title = title
        @price = price
        @total = total + price * quantity
        quantity.times do 
        @item << title
        @transactions << price
        end
        #binding.pry
    end

    def apply_discount
        # @discount = discount/100.0
        # apply = @total * discount
        # @total - apply
        # binding.pry
        if discount > 0
        @total -= (discount/100.0) * @total
        "After the discount, the total comes to $#{total.to_i}."
        else
        "There is no discount to apply."
        end
    end

    def items 
        #add item into item array every time the add_item method is called.
        @item
    end

    def void_last_transaction
        self.total = @total - @last_transaction
        
    end


end
