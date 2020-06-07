def bubble_sort(arr)
  arr.each_with_index do |val1, i|
    arr[i...arr.length].each_with_index do|val2, j|
      if arr[i] > arr[i + j]
        temp = arr[i]
        arr[i] = arr[i + j]
        arr[i + j] = temp
      end
    end
  end
  arr 
end

p bubble_sort([12,3,5,4,19,6,11])