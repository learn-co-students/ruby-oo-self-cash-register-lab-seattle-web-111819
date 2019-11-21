require 'pry'
class CashRegister
    attr_accessor :total 
    attr_reader :discount

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
        @previous_total = 0 
    end 

    def add_item(title, price, quantity=nil)
        @previous_total = @total 
        if quantity != nil && quantity > 0
           discount_price = quantity * price 
           items.concat([title]*quantity)
        else 
            discount_price = price
            @items << title  
        end  
        @total += discount_price
    end 

    def apply_discount
        if @discount == nil
            "There is no discount to apply."
        else 
        percent = self.discount.to_f / @total * 10  
        discounted_by = (percent*@total) 
        @total = (@total - discounted_by)
        "After the discount, the total comes to $#{@total.to_i}."
        end 
    end 

    def items
        @items 
    end 

    def void_last_transaction
        @total = @previous_total
    end 
   
end 