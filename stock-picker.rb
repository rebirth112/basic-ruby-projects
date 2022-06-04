prices = [17,3,6,9,15,8,6,1,10]
#prices = [0,0,0,0,0]
def stock_picker(stock_prices)
    #initiate all lists
    profit_list = []
    equation_list = []
    index_list = []
    chosen_list = []
    index = 0
    #insert into three list: the profit, the equation, and the index
    for x in (index..stock_prices.length-1) do
        for i in (index..stock_prices.length-1) do
            profit_list.push(stock_prices[i] - stock_prices[index])
            equation_list.push("$#{stock_prices[i]} - $#{stock_prices[index]}")
            index_list.push([index, i])
        end
        index += 1
        i += 1
    end
    index_location = profit_list.index(profit_list.max)
    equation_list[index_location]
    chosen_list.push(index_list[index_location]).flatten!
    p "Buy on #{chosen_list} # for a profit of #{equation_list[index_location]} == $#{profit_list.max}"
end
stock_picker(prices)

