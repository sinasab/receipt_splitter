=begin

small script to find prices of everyone's groceries when splitting up a receipt

input formatted like this, without quotes:

"10.99 s z k \n"

This input would mean "split an item that costs 10.99 evenly between s, z, and k".

enter "quit\n" or "\n" to quit

costs is hash of costs per person, where costs[x]=(how much x should pay)

tokens is the input, split at spaces, and would look something like this: [10.99, s, z, k] where an item that costs 10.99 should be split between s, z, and k.

to split something unevenly, eg. 1/3 for n, 2/3 for s, input "10.99 s s n".

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

#adds costs from tokens to appripriate entries in hash
def addCost(tokens, costs)
    for i in 1...tokens.length
        costs[tokens[i]]+=(tokens[0].to_f)*100/(tokens.length-1)
    end
end

#prints greeting and waits for user to hit enter
def start(greeting)
    puts greeting
    gets.chomp
end

#gets a line of input from console, returns token array
def getItem()
    print "\nEnter a new item: "
    s=gets.chomp
    return s.split
end

#start of main
greeting="Enter items in the following format (without the quotes, and where \"n\" is a newline): \"10.99 s z k \\n\"\nThat would be a 10.99 item split between s, z, and k. Enter \"quit\\n\" or \"\\n\" to quit.\n\nPress enter to start.\n"
start(greeting)
costs=Hash.new(0);
loop do
    tokens=getItem()
    break if(tokens.length<2)
    addCost(tokens, costs)
end
printCosts(costs)
