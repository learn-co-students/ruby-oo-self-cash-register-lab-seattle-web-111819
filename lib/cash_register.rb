require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :prices, :quantities

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
        @quantities = []
    end

    def add_item(title, price, quantity=1)
        quantity.times do
            @items << title
            @prices << price
            @quantities << quantity
        end
        @total = @prices.reduce(:+)
    end

    def apply_discount
        if @discount
            @total = @total * (100-@discount)/100
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @quantities.pop.times do
            @items.pop
            @prices.pop
        end
        @total = @prices.reduce(:+)
        @total = 0.0 if !total
    end
end