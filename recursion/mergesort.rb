require 'pry'

def merge(left_arr, right_arr)
  arr = []
  until left_arr.empty? || right_arr.empty?
    if left_arr.first <= right_arr.first
      arr << left_arr.shift
    else
      arr << right_arr.shift
    end
  end
  arr << left_arr.shift until left_arr.empty?
  arr << right_arr.shift until right_arr.empty?
  arr
end

def merge_sort(arr)
  if arr.length >= 2
    mid = arr.length / 2
    left = merge_sort(arr.take(mid))
    right = merge_sort(arr.drop(mid))
    merge(left, right)
  else
    return arr
  end
end


array = []
10.times do
  array << rand(100)
end

p array
p merge_sort(array)
