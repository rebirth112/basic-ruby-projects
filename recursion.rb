#iterative fib
def fibs(n)
    if n == 1 || n == 0
        return [0]
    end
    fibs_array = [0, 1]
    x = 3
    for i in (0..n-3)
        fibs_array.append(fibs_array[x-2] + fibs_array[x-3])
        x += 1
    end
    return fibs_array
end
#p fibs(8)
#p fibs(1)
#p fibs(5)

#recursive fib
@test_array = [0, 1]
def fib_rec(num)
    if num < 2
        return @test_array[num]
    else
        @test_array[num] = fib_rec(num-2) + fib_rec(num-1)
    end
end

#fib_rec(8)
@test_array.pop
#print @test_array

def merge_sort(arr)
    if (arr.length > 1)
        half = arr.length/2
        left_side = arr[0...half]
        right_side = arr[half...]
        merge_sort(left_side)
        merge_sort(right_side)
        x = 0
        y = 0
        z = 0
        while x < left_side.length && y < right_side.length
            if left_side[x] < right_side[y]
                arr[z] = left_side[x]
                x += 1
            elsif left_side[x] > right_side[y]
                arr[z] = right_side[y]
                y += 1
            end
            z += 1
        end

        while x < left_side.length
            arr[z] = left_side[x]
            z += 1
            x += 1
        end

        while y < right_side.length
            arr[z] = right_side[y]
            z += 1
            y += 1
        end
    end
    return arr
end

print merge_sort([5,4,1,2])
print "\n"
print merge_sort([6,7,1,2,19,10])
print "\n"




