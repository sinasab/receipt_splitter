=begin

small script to find prices of everyone's groceries

input formatted like this, without quotes:

"10.99 s z k \n"
where \n is the enter key.

enter"quit" to quit

=end

#prints costs from a hash
def printCosts(costs)
    print "\n"
    total=0
    costs.each do |key, value|
        print "\n#{key}: #{value/100}"
        total+=value
    end
    print "\n\ntotal: #{total/100}"
    return total/100
end

def addCost(tokens, costs)
    for i in 1...tokens.length
        costs[tokens[i]]+=(tokens[0].to_f)*100/(tokens.length-1)
    end
end

def start(greeting)
    puts greeting
    gets.chomp
end

def getItem()
    print "\nEnter a new item: "
    s=gets.chomp
    return s.split
end

greeting="Enter items in the following format (without the quotes, and where \"n\" is a newline): \"10.99 s z k \\n\"\nThat would be a 10.99 item split between s, z, and k. Enter \"quit\\n\" or \"\\n\" to quit.\n\nPress enter to start.\n"

start(greeting)
costs=Hash.new(0);
loop do
    tokens=getItem()
    break if(tokens.length<2)
    addCost(tokens, costs)
end
printCosts(costs)
