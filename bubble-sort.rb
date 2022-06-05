array_to_sort = [4,3,78,2,0,2]

def bubble_sort(array_to_sort)
    e = array_to_sort.count
    comparison_array = array_to_sort.clone
    p array_to_sort
    #compares with next index of array
    for i in (0..e-2) do
        if array_to_sort[i] > array_to_sort[i+1]
            array_to_sort[i], array_to_sort[i+1] = array_to_sort[i+1], array_to_sort[i]
            p array_to_sort
        end
    end
    #recursion if original does not equal the sorted
    if comparison_array != array_to_sort
        bubble_sort(array_to_sort)
    end
end

bubble_sort(array_to_sort)