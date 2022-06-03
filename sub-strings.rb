dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(strings, dictionary)
    #initialize all empty arrays and hashes
    empty_array = []
    count_array = []
    z = 0
    new_hash = {}
    #remove all punctuation and non letters
    strings = strings.tr("!", "").tr(',', '').tr("'", "").downcase
    string_array = strings.split(' ')
    #push into new array all sublist of characters
    string_array.each do |element|
        for z in (0..(element.length-1)) do
            for i in (0..(element.length-1)) do
                empty_array.push(element[z..i])
                i += 1
            end
        end
    end
    #eliminate all empty arrays and nil values
    empty_array.reject!{|element| element.empty?}
    empty_array.compact!
    #fill count array with number of times empty_array shows up
    for i in (0..empty_array.length-1) do
        count_array.append(dictionary.count(empty_array[i]))
    end
    #create hash, add another 1 to the value if the key already exists
    for i in (0..empty_array.length-1) do
        if new_hash.key?(empty_array[i])
            new_hash[empty_array[i]] = new_hash[empty_array[i]] + count_array[i]
        else 
            new_hash[empty_array[i]] = count_array[i]
        end
    end
    #delete all 0 values and return new_hash
    new_hash.delete_if {|key, value| value == 0}
    return new_hash
end

p substrings("Below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)