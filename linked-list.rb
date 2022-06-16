public
class Node
    def initialize(value=nil, next_node=nil)
        @value = value
        @next_node = next_node
    end

    def value
        @value
    end
    
    def next_node
        @next_node
    end

    def value=(v)
        @value = v
    end

    def next_node=(n)
        @next_node = n
    end

    def print_both
        puts @value, @next_node
    end
end

class LinkedList
    def initialize(value, next_node=nil)
        @new_node = Node.new(value, nil)
        @size = 1
    end

    def head
        return @new_node
    end

    def tail
        current = @new_node
        while current.next_node != nil
            current = current.next_node
        end
        return current.value
    end

    def pop
        @size -= 1
        current = @new_node
        while current.next_node.next_node != nil
            current = current.next_node
        end
        current.next_node = nil
    end

    def append(value)
        current = @new_node
        while current.next_node != nil
            current = current.next_node
        end
        current.next_node = Node.new(value, nil)
        @size += 1
    end

    def prepend(value)
        current = @new_node
        prepend_value = Node.new(value, current)
        @new_node = prepend_value
    end

    def size
        return @size
    end

    def to_s
        @final_array = []
        current = @new_node
        while current.next_node != nil
            current.value = current.value.to_s
            @final_array << current.value
            current = current.next_node
        end
        @final_array << current.value.to_s
        @final_array << current.next_node
        print @final_array
        print "\n"
    end

    def at(index)
        current = @new_node
        count = -1
        while current != nil
            count += 1
            if count == index
                puts current.value
            else
                current = current.next_node
            end
        end
    end

    def contains?(value)
        current = @new_node
        while current.next_node != nil
            if current.value == value
                puts "#{value} was found within the linked list."
                return true
                break
            elsif current.value != value
                current = current.next_node
            end
        end
        if current.value != value
            puts "#{value} was NOT found within the linked list."
            return false
        else
            puts "#{value} was found within the linked list."
            return true
        end
    end

    def find(value)
        current = @new_node
        index_number = 0
        while current.next_node != nil
            if current.value == value
                return index_number
                break
            else
                current = current.next_node
                index_number += 1
            end
        end
        if current.value != value
            return nil
        else
            return index_number
        end
    end

end

new_link = LinkedList.new(50, nil)

new_link.append(5)
new_link.append(6)
#new_link.to_s
#puts new_link.size
#puts new_link.head
#puts new_link.tail
new_link.prepend(2)
#new_link.to_s
#new_link.pop
#new_link.to_s
#new_link.at(1)
#new_link.contains?(5)
#new_link.contains?(6)
#new_link.contains?(99)
puts new_link.find(5)
puts new_link.find(999)




